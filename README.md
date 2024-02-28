# README

## Git log

```sh
git log --numstat
```

```sh
git log --all --numstat --date=short --pretty=format:'--%h--%ad--%aN' --no-renames --after=YYYY-MM-DD --before=YYYY-MM-DD > logfile.log
```

- git legacy

  ```sh
  git log --pretty=format:'[%h] %aN %ad %s' --date=short --numstat --after=YYYY-MM-DD > logfile.log
  ```

## Run code maat

1. Help

   ```sh
   java -jar code-maat-1.1-SNAPSHOT-standalone.jar -h
   ```

2. Analysis Options `-a, --analysis`

   abs-churn, age, author-churn, authors, communication, coupling, entity-churn, entity-effort, entity-ownership, fragmentation, identity, main-dev, main-dev-by-revs, messages, refactoring-main-dev, revisions, soc, summary

   - example

     ```sh
     java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a authors
     ```

3. Run Code Maat

   1. Summary Data

      ```sh
      java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a summary
      ```

   2. Analyze Change Frequencies

      ```sh
      java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a revisions
      ```

   3. Calculate code age

      ```sh
      java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a age
      ```

   4. Mining logical coupling

      ```sh
      java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a coupling
      ```

   5. Code churn measures

      ```sh
      java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a abs-churn
      ```

   6. churn by author

      ```sh
      java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a author-churn
      ```

   7. churn by entity

      ```sh
      java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a entity-churn
      ```

   8. entity ownership

      ```sh
      java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a entity-ownership
      ```

   9. entity effort

      ```sh
      java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a entity-effort
      ```

   10. main developer

       ```sh
       java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a main-dev
       ```

---

## Complexity and Frequency in Git

Prerequisite you have to install [cloc](https://github.com/AlDanial/cloc)

1. Analyze `revisions` from `logfile.log`

   ```sh
   java -jar code-maat-1.1-SNAPSHOT-standalone.jar -l logfile.log -c git2 -a revisions > revisions.csv
   ```

2. Analyze line of code with `cloc`

   - nodejs

     ```sh
     cloc ./ --by-file --csv --quiet --exclude-dir=node_modules --report-file=./lines.csv
     ```

   - .NetCore

     ```sh
     cloc ./ --by-file --csv --quiet --exclude-dir=bin,obj --report-file=./lines.csv
     ```

3. Analyze `complexity` and `frequency` with `merge_comp_freqs.py`

   ```sh
   python3 merge_comp_freqs.py revisions.csv lines.csv > comp-freqs.csv
   ```

---

## Simplify by Run Code Maat via Script

1. Create directory call `code-maat`
2. Copy the following artifacts to `code-maat` directory

   - code-maat-1.1-SNAPSHOT-standalone.jar
   - merge_comp_freqs.py
   - xlog.sh

3. Set `MAAT_HOME`

   - linux, mac: `.bachrc`

     ```sh
     export MAAT_HOME=<path to code-maat directory>

     export PATH="$PATH:$MAAT_HOME"
     ```

4. Open `terminal` and run `xlog.sh` in root project
   - xlog.sh will create folder that contain the statistics call `data` in root project

---

[code maat](https://github.com/adamtornhill/code-maat)
