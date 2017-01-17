{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}
  {% set page_title_suffix = ' | ' + config.title %}

  {% if page.type === "categories" and not page.title  %}
    {{ __('title.category') + page_title_suffix }}
  {% elif page.type === "tags" and not page.title  %}
    {{ __('title.tag') + page_title_suffix }}
  {% else %}
    {{ page.title + page_title_suffix }}
  {% endif %}
{% endblock %}

{% block content %}

  <div id="posts" class="posts-expand">
  {% include '_partials/page-header.swig' %}
    {# tagcloud page support #}
    {% if page.type === "tags" %}
      <div class="tag-cloud">
        <div class="tag-cloud-title">
            {{ _p('counter.tag_cloud', site.tags.length) }}
        </div>
        <div class="tag-cloud-tags">
          {{ tagcloud({min_font: 12, max_font: 30, amount: 200, color: true, start_color: '#ccc', end_color: '#111'}) }}
        </div>
      </div>
    {% elif page.type === 'categories' %}
      <div class="category-all-page">
        <div class="category-all-title">
            {{ _p('counter.categories', site.categories.length) }}
        </div>
        <div class="category-all">
          {{ list_categories() }}
        </div>
      </div>
    {% elif page.type === 'issue' %}
      <blockquote class="blockquote-center leave-message">快来留言吧！~请在 <a href="https://github.com/aak1247/aak1247.github.io/issues/1" target="_blank">Github issue</a> 页面完成操作_(:з」∠)_</blockquote>
      <div class="comments" id="comments">
        <div class="ds-thread" id="ds-thread">
          <div id="ds-reset">
            <div class="ds-comments-info">
              <ul class="ds-comments-tabs">
                <li class="ds-tab">
                  <a class="ds-comments-tab-duoshuo ds-current" href="javascript:void(0);">
                  <span class="ds-highlight" id="ghComment-count">1</span>条留言</a>
                </li>
            </div>
            <ul class="ds-comments" id="ghComment" style="opacity: 1"></ul>
          </div>
        </div>
      </div>
      <script type="text/javascript" src="{{ url_for(theme.js) }}/src/issue.js"></script>
    {% elif page.type === 'about'%}
      <blockquote class="blockquote-center leave-message">快来留言吧！~请在 <a href="https://github.com/aak1247/aak1247.github.io/issues/1" target="_blank">Github issue</a> 页面完成操作_(:з」∠)_</blockquote>
      <div class="comments" id="comments">
        <div class="ds-thread" id="ds-thread">
          <div id="ds-reset">
            <div class="ds-comments-info">
              <ul class="ds-comments-tabs">
                <li class="ds-tab">
                  <a class="ds-comments-tab-duoshuo ds-current" href="javascript:void(0);">
                  <span class="ds-highlight" id="ghComment-count">1</span>条留言</a>
                </li>
            </div>
            <ul class="ds-comments" id="ghComment" style="opacity: 1"></ul>
          </div>
        </div>
      </div>
      <script type="text/javascript" src="{{ url_for(theme.js) }}/src/issue.js"></script>
    {% else %}
      {{ page.content }}
    {% endif %}
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
