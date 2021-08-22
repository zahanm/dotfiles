function bean-shell -d "Prepare to count some beans"
  pushd /Users/zahanm/source/accounts/
  command pwd
  echo # newline
  echo "\
# Every time
code .
source ../collect-beans/env.fish

# Update transactions
python ../collect-beans/collector.py CONFIG.yaml --existing main.beancount --days 10
../collect-beans/categorise-and-insert.sh CONFIG.yaml 2021.beancount main.beancount collected_beans_transactions.db
# use 'Git: Open Changes' in VS Code to see what was inserted

# Update balances
python ../collect-beans/collector.py CONFIG.yaml --balance
../collect-beans/categorise-and-insert.sh CONFIG.yaml 2021.beancount main.beancount collected_beans_balance.db

# Expenses analysis
python ../collect-beans/analysis/spending.py main.beancount --exclude 'Expenses:Taxes' --exclude 'Expenses:Home:Payment' --exclude 'Expenses:Home:PropertyTax' --exclude 'Expenses:Reimbursable'

# Updating credentials
python ../collect-beans/server/index.py
# Open 1Password and look for the relevant *Plaid* credential.
# Unfortunately, I've had to create a new `access_token` every time for it to work.
# Update the Plaid account ID in CONFIG.yaml

# Anything else? bear://x-callback-url/open-note?id=97B280EC-10D3-4E92-B188-D5DBEE75F9F8-28051-00005F1669BB8CD0&new_window=yes
  "
  if not contains -- --instructions $argv
    pipenv shell # this must be the last command, since it spawns a new shell
  end
  popd
end
