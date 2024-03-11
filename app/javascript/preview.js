
// 新規投稿・編集ページでのみ、preview.jsが動作するように設定する

document.addEventListener('DOMContentLoaded', function(){
    // 新規投稿・編集ページのフォームを取得
    const postForm = document.getElementById('new_post'); //form_withのid
    // プレビューを表示するためのスペースを取得
    const previewList = document.getElementById('previews'); //プレビュー画像を表示する場所を追加したid
    // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
    if (!postForm) return null;
    console.log("preview.jsが読み込まれました");
  });
  
  
  