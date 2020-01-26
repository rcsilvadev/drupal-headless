import React from 'react';
import ReactHtmlParser from 'react-html-parser';

class BlogPost extends React.Component {
  render() {
    const post = this.props.post;

    const postBody = document.createElement('div');
    postBody.innerHTML = post.body;

    return(
      <article className="blog-post">
        <h2 className="blog-post__title">
          {post.title}
        </h2>
        <div className="blog-post__body">
          {ReactHtmlParser(post.body)}
        </div>
      </article>
    );
  }
}

export default BlogPost;