# README

## Git log

```sh
git log --numstat
```

```sh
git log --all --numstat --date=short --pretty=format:'--%h--%ad--%aN' --no-renames --after=YYYY-MM-DD --before=YYYY-MM-DD > logfile.log
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

[code maat](https://github.com/adamtornhill/code-maat)
