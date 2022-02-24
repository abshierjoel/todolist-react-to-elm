import './App.css';
import { useState } from 'react';

function App() {
  const [items, setItems] = useState([]);

  const addItem = (item) => {
    setItems([item, ...items]);
  };

  return (
    <div className='App'>
      <Todos items={items} />
      <TodoForm addItem={addItem} />
    </div>
  );
}

const Todos = ({ items }) => (
  <ul>
    {items.map((item, i) => (
      <li key={i}>{item}</li>
    ))}
  </ul>
);

const TodoForm = ({ addItem }) => {
  const [text, setText] = useState('');

  const handleInput = (e) => {
    setText(e.target.value);
  };

  const handleSubmit = () => {
    if (text.length > 0) {
      addItem(text);
      setText('');
    }
  };

  return (
    <>
      <input type='text' value={text} onChange={handleInput} />
      <input type='submit' value='Add' onClick={handleSubmit} />
    </>
  );
};

export default App;
