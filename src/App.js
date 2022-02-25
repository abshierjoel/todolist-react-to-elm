import './App.css';
import { useState } from 'react';
import wrap from '@elm-react/component';

import TodoList from './TodoList.elm';
const TodoListComponent = wrap(TodoList);

function App() {
  const [items, setItems] = useState([]);
  const addItem = (item) => setItems([item, ...items]);

  return (
    <div className='App'>
      <h1>Todo List App</h1>
      <TodoListComponent updatedItems={items} />
      <TodoForm addItem={addItem} />
    </div>
  );
}

const TodoForm = ({ addItem }) => {
  const [text, setText] = useState('');

  const handleInput = (e) => {
    setText(e.target.value);
  };

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
