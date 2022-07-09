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
    return b.end_date - a.end_date;
  });

  const labels = items.map((item) => `${item.name} [${item.end_date}]`);
  const barcolors = items.map((item) =>'#' + Math.floor(Math.random()*16777215).toString(16))
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
