import React from 'react';

const KpiCard = ({label, val}) => {

  return (

    <div className="card">
      <div className="card-body">
        <p className="card-text">{ label }</p>
        <h5 className="card-title">{ val }</h5>
      </div>
    </div>

  )}

  export default KpiCard
