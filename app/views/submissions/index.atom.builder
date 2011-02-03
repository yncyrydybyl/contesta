atom_feed(:url => submission_url(:atom)) do |feed|
  feed.title("submissions")
    feed.updated(@submissions.first ? @submissions.first.created_at : Time.now.utc)
  
    for submission in @submissions
      feed.entry(submission) do |entry|
        entry.title(submission.title)
        entry.content(submission.description, :type => 'html')

        entry.author do |author|
          author.name(submission.user.email)
          author.email(submission.user.email)
        end
      end
    end
  end
