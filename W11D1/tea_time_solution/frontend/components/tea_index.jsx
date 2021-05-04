import React from 'react';
import TeaForm from './tea_form';

class TeaIndex extends React.Component {
  componentDidMount() {
    this.props.fetchAllTeas();
  }

  render() {
    return (
      <div>
        <h1>All Teas</h1>
        <ul>
          {
            this.props.teas.map(tea => <li key={tea.id}>Flavor: {tea.flavor}</li>)
          }
        </ul>
        <TeaForm receiveTea={this.props.receiveTea} />
        <h3>Green Teas</h3>
        <ul>
          {
            this.props.greenTeas.map(tea => {
              return (
                <li key={tea.id}>{tea.flavor}</li>
              )
            })
          }
        </ul>
      </div>
    )
  }
}

export default TeaIndex;