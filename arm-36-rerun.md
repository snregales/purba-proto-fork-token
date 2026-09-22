# Arm R, the sign job restarts what its push stalled

purba #36. The sign job gains `actions: write` and, after the force-push,
finds every run on the new head that concluded `action_required` and posts
`/rerun` for it.

The question: does a restart driven by `GITHUB_TOKEN` execute, or does it
stall for the same reason the push did?
