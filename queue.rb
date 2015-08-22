Queue = Array.extract([
  :first,
  :push,
  :shift,
  :clear,
  :size,
  :inspect,
  :to_s
]).rename(
  :push   =>  :enqueue,
  :shift  =>  :dequeue
)
