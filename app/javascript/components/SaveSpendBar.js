import React from 'react';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
  TimeScale,
  TimeSeriesScale,
} from 'chart.js';
import { Bar, Utils } from 'react-chartjs-2';
import 'chartjs-adapter-moment'

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  TimeScale,
  TimeSeriesScale,
  Title,
  Tooltip,
  Legend
);

const reds = ['#ffcccc', '#ffb3b3', '#ff9999','#ff8080', '#ff6666', '#ff4d4d', '#ff1a1a']
const greens = ['#99ff99', '#80ff80', '#66ff66', '#4dff4d', '#33ff33']

const SaveSpendBar = ({items, time_unit, start_date, end_date}) => {

  const  options = {
    plugins: {
      legend: {
        display: false,
        position: 'right',
      },
      title: {
        display: false,
        text: 'My Items'
      },
    },
    responsive: true,
    scales: {
      x: {
        type: 'time',
                time: {
                    unit: time_unit,
                    round: time_unit
                },
        stacked: true,
      },
      y: {
        stacked: true
      }
    }
  }

  items.sort((a, b) => {
    const a_date = Date.parse(a.end_date)
    const b_date = Date.parse(b.end_date)
    return b_date - a_date;
  });

  items = items.filter((item) => item.end_date > start_date)
  items = items.filter((item) => item.end_date < end_date)

  const datasets = []
  items.forEach((item) => {
    let dataset = {}
    dataset.label = item.name
    console.log()
    const y_value = item.status == "Purchased" ? -item.value : item.value
    let bgcolor = ''
    switch(item.status) {
      case "Purchased":
        bgcolor = reds[Math.floor(Math.random()*reds.length)]
        break;
      case "Abandoned":
        bgcolor = greens[Math.floor(Math.random()*greens.length)]
        break;
      default:
        bgcolor = '#ffff00'
    }
    // console.log(`${item.name} ${x_date} ${x_date.getMonth() + 1}`)
    dataset.data = [{x: Date.parse(item.end_date), y: y_value}]
    dataset.backgroundColor = bgcolor
    dataset.borderColor = '#737373'
    dataset.borderWidth = 1
    datasets.push(dataset)
  })

  const data = {
    datasets: datasets
}

  return (
  <div id='save-spend-bar' className="card w-100 bg-white p-5 text-center">
    <h2>My Items</h2>
    <Bar id='SaveSpendBar' options={options} data={data}></Bar>
  </div>
  )
}

export default SaveSpendBar
