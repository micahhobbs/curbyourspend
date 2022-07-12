import React from 'react';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';
import { Bar, Utils } from 'react-chartjs-2';

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend
);

const ItemsBar = ({items}) => {

  const options = {
    indexAxis: 'y',
    elements: {
      bar: {
        borderWidth: 2,
      },
    },
    responsive: true,
    plugins: {
      legend: {
        display: false,
        position: 'right',
      },
      title: {
        display: true,
        text: 'My Items',
      },
    },
  };

  items.sort((a, b) => {
    const a_date = Date.parse(a.end_date)
    const b_date = Date.parse(b.end_date)
    return b_date - a_date;
  });

  const labels = items.map((item) => `${item.name} [${item.end_date}] (${item.status})`);
  const barcolors = items.map((item) => {
    let color = '#ffff00'
    switch(item.status) {
      case "Purchased":
        color = '#ff6666'
        break;
      case "Abandoned":
        color = '#66ff66'
        break;
      default:
        color = '#ffff00'
    }
    return color
  }
  )

  const data = {
  labels: labels,
  datasets: [{
    data: items.map((item) => item.value),
    backgroundColor: barcolors,
    borderWidth: 1
  }]
  };


  return <Bar options={options} data={data}></Bar>

}

export default ItemsBar
