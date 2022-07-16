import React from 'react';
import SaveSpendBar from './SaveSpendBar';
import KpiCard from './KpiCard';
import { useState } from 'react';

const Dashboard = ({items}) => {
  const [startDate, setstartDate] = useState('1990-01-01')
  const [endDate, setendDate] = useState('2222-03-10')
  const [timeUnit, settimeUnit] = useState('month')


  items = items.filter((item) => item.start_date > startDate && item.end_date < endDate)
  let total_value = 0
  items.forEach((item)=>{
    total_value += item.value
  })

  const min_date = items.map((item)=>items.)

  return (
    <div className='container'>

    <div className='text-right'>
      <input type='Date' name='start-date' onChange={(e) => setstartDate(e.target.value)} />
      <input type='Date' name='end-date' onChange={(e) => setendDate(e.target.value)} />

    <div>
      <input type="range" id="date-range" name="volume" min= max="11"/>
      <label for="date-range">Volume</label>
    </div>

    <select id="select1" onChange={(e)=>settimeUnit(e.target.value)}>
          <option value="month">Monthly</option>
          <option value="week">Weekly</option>
    </select>

    </div>

    <div className='cards text-center'>
      <KpiCard label='Number of Items' val={ items.length } />
      <KpiCard label='Total Value' val={ new Intl.NumberFormat('en-AU', {style: 'currency', currency: 'AUD'}).format(total_value)} />
      <KpiCard label='Total Saved' val={ new Intl.NumberFormat('en-AU', {style: 'currency', currency: 'AUD'}).format(5000)} />
    </div>
    <hr></hr>
    <SaveSpendBar start_date={startDate} end_date={endDate} items={items} time_unit={timeUnit}/>
    </div>
  )
}

export default Dashboard
