echo "Cleaning up template..."
if ((Test-Path 'metadata.json') -and (Test-Path 'manifests/init.pp') -and (Test-Path 'manifests/params.pp') -and (Test-Path 'spec/classes/init_spec.rb') -and (Test-Path 'tests/init.pp') -and (Test-Path '.fixtures.yml')){
  echo "Deleting .orig templates..."
  Remove-Item 'metadata.orig.json'
  Remove-Item 'manifests/init.pp.orig'
  Remove-Item 'manifests/params.pp.orig'
  Remove-Item 'spec/classes/init_spec.rb.orig'
  Remove-Item 'tests/init.pp.orig'
  Remove-Item 'README.markdown'
  Remove-Item 'README.blank.md'
  Remove-Item '.fixtures.yml.orig'
  Remove-Item 'unblank.ps1'
  Remove-Item 'cleanup.ps1'
} else {
  throw "ERROR: Cannot find required files, have you run unblank.ps1?"
}
