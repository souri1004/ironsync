import { useState, useEffect } from 'react'
import axios from 'axios'
import './App.css'

function App() {
  const [audits, setAudits] = useState([])
  const [loading, setLoading] = useState(true)

  // Fetch Data Function
  const fetchAudits = async () => {
    try {
      setLoading(true) // Show loading state briefly on refresh
      const response = await axios.get('http://localhost:8000/audits/') 
      setAudits(response.data)
    } catch (error) {
      console.error("Error fetching data:", error)
    } finally {
      setLoading(false)
    }
  }

  // Run on page load & auto-refresh
  useEffect(() => {
    fetchAudits()
    const interval = setInterval(fetchAudits, 5000)
    return () => clearInterval(interval)
  }, [])

  return (
    <div className="dashboard-container">
      {/* Header Section */}
      <header className="header">
        <div className="title">
          <h1>IronSync Command Center</h1>
          <div className="subtitle">Real-time Field Operations Monitor</div>
        </div>
        <button className="refresh-btn" onClick={fetchAudits}>
          Refresh Data ↻
        </button>
      </header>

      {/* Main Content */}
      <div className="table-container">
        {loading && audits.length === 0 ? (
          <div className="empty-state">Loading satellite data...</div>
        ) : audits.length === 0 ? (
          <div className="empty-state">
            <h3>No Active Audits</h3>
            <p>Field agents are offline. Waiting for sync uplink...</p>
          </div>
        ) : (
          <table>
            <thead>
              <tr>
                <th>Audit ID</th>
                <th>Title</th>
                <th>Location</th>
                <th>Inspector</th>
                <th>Live Status</th>
              </tr>
            </thead>
            <tbody>
              {audits.map((audit) => (
                <tr key={audit.id}>
                  <td style={{ fontFamily: 'monospace', color: '#64748b' }}>
                    {String(audit.id).substring(0, 8)}...
                  </td>
                  <td style={{ fontWeight: '600' }}>{audit.title}</td>
                  <td>{audit.site_location}</td>
                  <td>
                    <span style={{ color: '#94a3b8' }}>Agent: </span>
                    {audit.inspector_id}
                  </td>
                  <td>
                    <div className="status-badge">
                      <span className="dot"></span>
                      SYNCED
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
    </div>
  )
}

export default App