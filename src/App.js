import './App.css';
import { useState } from 'react';

const App = ({ ports }) => {
  const [items, setItems] = useState([]);
  const addItem = ports.addItem.send;

  ports.sendItems.subscribe((items) => setItems(items));

  return (
    <div className='App'>
      <h1>Todo List App</h1>
      <Todos items={items} />
      <TodoForm addItem={addItem} />
    </div>
  );
};

const Todos = ({ items }) => (
  <ul>
    {items.map((item, i) => (
      <li key={i}>{item}</li>
    ))}
  </ul>
);

const TodoForm = ({ addItem }) => {
  const [text, setText] = useState('');

  const handleInput = (e) => setText(e.target.value);
  const handleSubmit = (e) => {
    e.preventDefault();

    if (text.length > 0) {
      addItem(text);
      setText('');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <input type='text' value={text} onChange={handleInput} />
      <input type='submit' value='Add' />
    </form>
  );
};

export default App;
