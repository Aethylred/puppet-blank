Param($author,$module)
if ($author -match "^\w+$") {
  if ($module -match "^\w+$") {
    echo "Update README.md..."
    $readme = Get-Content README.blank.md
    $readme = Foreach-Object {$readme -replace "blank-blank", $module}
    $readme = Foreach-Object {$modulefile -replace "authorauthor", $author}
    $readme = Foreach-Object {$modulefile -replace "yearyear", (Get-Date).Year }
    Set-Content README.md $readme
    echo "Modulefile updated."

    echo "Update metadata.json..."
    $modulefile = Get-Content metadata.orig.json
    $modulefile = Foreach-Object {$modulefile -replace "authorauthor", $author}
    $modulefile = Foreach-Object {$modulefile -replace "blank", $module}
    Set-Content metadata.json $modulefile
    echo "metadata.json updated."

    echo "Update manifests/init.pp..."
    $initfile = Get-Content manifests/init.pp.orig
    $initfile = Foreach-Object {$initfile -replace "blank", $module}
    Set-Content manifests/init.pp $initfile
    echo "manifests/init.pp updated."

    echo "Update manifests/params.pp..."
    $initfile = Get-Content manifests/params.pp.orig
    $initfile = Foreach-Object {$initfile -replace "blank", $module}
    Set-Content manifests/params.pp $initfile
    echo "manifests/params.pp updated."

    echo "Update spec/classes/init_spec.rb..."
    $initfile = Get-Content spec/classes/init_spec.rb.orig
    $initfile = Foreach-Object {$initfile -replace "blank", $module}
    Set-Content spec/classes/init_spec.rb $initfile
    echo "spec/classes/init_spec.rb updated."

    echo "Update tests\init.pp..."
    $testfile = Get-Content tests/init.pp.orig
    $testfile = Foreach-Object {$testfile -replace "blank", $module}
    Set-Content tests/init.pp $testfile
    echo "tests/init.pp updated."

    echo "Update .fixtures.yml..."
    $modulefile = Get-Content .fixtures.yml.orig
    $modulefile = Foreach-Object {$modulefile -replace "aethylred", $author}
    $modulefile = Foreach-Object {$modulefile -replace "blank", $module}
    Set-Content .fixtures.yml $modulefile
    echo ".fixtures.yml updated."

  } else {
    throw "ERROR: Bad module parameter '$module', must be a single word made up of word caracters [a-zA-Z_0-9]"
  }
} else {
  throw "ERROR: Bad author parameter '$author', must be a single word made up of word caracters [a-zA-Z_0-9]"
}