# Arm D, the sign job dispatches the quality workflow

purba #36. After the force-push the sign job calls
`gh workflow run quality.yml --ref "$HEAD_REF"`.

`workflow_dispatch` is the one event GitHub starts from a workflow's own
token. The dispatched run takes the branch tip, which is the head this job
just wrote.

The question: does the dispatched run write a check run named `Quality` on
that head, and does the ruleset accept it?
