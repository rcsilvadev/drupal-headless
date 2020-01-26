import React from 'react';
import BlogPost from './BlogPost';

class BlogList extends React.Component {
  render() {
    const postList = this.props.posts;
    const posts = [];

    postList.forEach(post => {
      posts.push(
        <BlogPost post={post} key={post.nid} />
      );
    });

    return(
      <section className="blog-list">
        {posts}
      </section>
    );
  }
}


export default BlogList;