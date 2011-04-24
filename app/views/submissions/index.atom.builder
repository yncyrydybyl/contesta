atom_feed(:url => submission_url(:atom)) do |feed|
  feed.title("submissions for meego coding competition")
  feed.updated(@submissions.first.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
  
    for submission in @submissions
      feed.entry(submission) do |entry|
        entry.title(submission.title)
        entry.content(submission.description, :type => 'html')
        entry.updated(submission.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) # needed to work with Google Reader.
        entry.author do |author|
          author.name(submission.user.email)
          author.email(submission.user.email)
        end
      end
    end
  end
