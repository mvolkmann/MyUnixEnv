function handleHupSignal --on-process-exit %self
  echo 'got process exit' > process.log
end
