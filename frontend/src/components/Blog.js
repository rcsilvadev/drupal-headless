import React from 'react';
import BlogList from './BlogList';
import './blog.scss';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      error: false,
      isLoaded: false,
      posts: []
    };  
  }

  componentDidMount() {
    fetch("http://localhost/api/blogs")
    .then(res => {
      const posts = res.json();
      return posts;
    })
    .then(posts => {
      this.setState({
        isLoaded: true,
        posts: posts
      });
    }, error => {    
      this.setState({
        isLoaded: true,
        error: true,
      })
    })
  }

  render() {
    const { error, isLoaded, posts } = this.state;

    if (error) {
      return <div>Unable to load the component: {error.message}</div>;
    } else if (!isLoaded) {
      return <div>Loading...</div>;
    } else {

      return(
        <div className="app">
          
          <header className="header">
            <h1 className="header__title">Drupal Headless blog</h1>
          </header>
  
          <BlogList posts={this.state.posts} />
  
        </div>
      )
    }
  }
}

export default App;