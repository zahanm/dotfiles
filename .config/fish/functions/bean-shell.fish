function bean-shell -d "Prepare to count some beans"
  pushd /Users/zahanm/source/accounts/
  command pwd
  echo # newline
  echo "\
# Every time
source ../collect-beans/env.fish

# Update transactions
python ../collect-beans/collector.py CONFIG.yaml --existing personal.beancount --days 10
python ../collect-beans/insert.py CONFIG.yaml collected_beans_transactions.db personal.beancount > tmp-personal.beancount; and mv tmp-personal.beancount personal.beancount
# use 'Git: Open Changes' in VS Code to see what was inserted

# Update balances
python ../collect-beans/collector.py CONFIG.yaml --balance
python ../collect-beans/insert.py CONFIG.yaml collected_beans_balance.db personal.beancount > tmp-personal.beancount; and mv tmp-personal.beancount personal.beancount

# Expenses analysis
python ../collect-beans/analysis/spending.py personal.beancount --exclude 'Expenses:Taxes' --exclude 'Expenses:Home:Payment' --exclude 'Expenses:Home:PropertyTax' --exclude 'Expenses:Reimbursable'

# Updating credentials, etc., see note bear://x-callback-url/open-note?id=97B280EC-10D3-4E92-B188-D5DBEE75F9F8-28051-00005F1669BB8CD0&new_window=yes
  "
  pipenv shell # this must be the last command, since it spawns a new shell
  popd
end
