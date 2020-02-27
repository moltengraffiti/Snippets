/**
 * @File Name          : chatterPost.cls
 * @Description        : 
 * @Author             : Sam Reilly
 * @Group              : 
 * @Last Modified By   : Sam Reilly
 * @Last Modified On   : 27/02/2020, 10:17:49 am
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    27/02/2020   Sam Reilly     Initial Version
**/
        FeedItem newPost = new FeedItem();
        newPost.Title=title;
        newPost.Body=subject;
        //TODO - this should be queried or in custom mdata - not hardcoded
        newPost.ParentId = 'chatterGroupIdHere';
        newPost.Type='TextPost';
        insert newPost;

        FeedComment testFeed1Comment = new FeedComment(CommentBody=msgBodyText, FeedItemId=newpost.Id, CommentType='TextComment');
            insert testFeed1Comment;