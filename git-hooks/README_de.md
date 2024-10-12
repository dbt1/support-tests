## Inhaltsverzeichnis

- [Inhaltsverzeichnis](#inhaltsverzeichnis)
- [Verfügbare Hook-Vorlagen](#verfügbare-hook-vorlagen)
  - [prepare-commit-msg](#prepare-commit-msg)
    - [Allgemeiner Workflow](#allgemeiner-workflow)
    - [Funktion](#funktion)
- [Installation](#installation)
  - [Installation für ein beliebiges lokales Repository](#installation-für-ein-beliebiges-lokales-repository)
  - [Globale Installation](#globale-installation)
- [Erweiterung](#erweiterung)
- [Beitrag leisten](#beitrag-leisten)
- [API-Schlüssel Einrichten](#api-schlüssel-einrichten)

## Verfügbare Hook-Vorlagen

### prepare-commit-msg

#### Allgemeiner Workflow

Der `prepare-commit-msg` Hook wird vor der Erstellung der eigentlichen Commit-Nachricht ausgeführt. Er wird automatisch aktiviert, wenn der Commit-Prozess beginnt und bietet die Möglichkeit, die Standard-Commit-Nachricht zu modifizieren oder zu erweitern, bevor der Nutzer sie sieht. Dies macht ihn besonders nützlich, um Commit-Richtlinien durchzusetzen und die Qualität der Commit-Nachrichten zu verbessern.

#### Funktion

Dieser Hook soll helfen, die Qualität der Commit-Nachrichten zu verbessern, Standards und Konventionen durchzusetzen und automatisch generierte Nachrichten zu erzeugen, die den Anforderungen des Projekts entsprechen. Es protokolliert relevante Informationen in einer Logdatei und verwendet die OpenAI API, um automatisch klare und konsistente Commit-Nachrichten zu generieren, falls ein API-Schlüssel gesetzt ist.

Dieser Hook führt folgende Schritte aus:
- Erstellt das Verzeichnis für die Logdatei und schreibt Parameterinformationen hinein.
- Unterscheidet verschiedene Commit-Typen, wie normale Commits, Amendments, oder Commits mit speziellen Optionen (z.B. `-m`).
- Bei Vorhandensein eines API-Schlüssels wird der Unterschied (Diff) der gestagten Änderungen an die OpenAI API gesendet, um eine prägnante Commit-Nachricht zu erzeugen.
- Die automatisch generierte Commit-Nachricht wird in die Commit-Datei geschrieben, falls sie erfolgreich empfangen wurde.

## Installation

Um diesen Hook direkt für dieses Support-Repository nutzbar zu machen, kannst du einen Symlink in das Verzeichnis `.git/hooks` anlegen. Wechsle dafür in das Verzeichnis `support/git-hooks` und gib diesen Befehl ein.

```bash
ln -s ../../git-hooks/prepare-commit-msg ../.git/hooks/prepare-commit-msg
```

So kannst du direkt am Hook arbeiten und Änderungen sofort testen, ohne das Skript jedes Mal kopieren zu müssen.

### Installation für ein beliebiges lokales Repository

Folge diesen Schritten, um den `prepare-commit-msg` Hook in ein beliebiges lokales Repository auf deinem System zu installieren:

1. **Repository klonen:**
   ```bash
   git clone https://github.com/tuxbox-neutrino/support.git
   cd support/git-hooks
   ```

2. **Hook-Skript in das gewünschte lokale Repository deiner Wahl kopieren:**
   Kopiere das `prepare-commit-msg` Hook-Skript in das `.git/hooks/` Verzeichnis deines lokalen Repositories:
   ```bash
   cp prepare-commit-msg /pfad/zu/deinem/repo/.git/hooks/
   ```

   *Ersetze `/pfad/zu/deinem/repo` durch den Pfad zu deinem lokalen Git-Repository.*

3. **Ausführungsrechte setzen:**
   Stelle sicher, dass das Hook-Skript ausführbar ist:
   ```bash
   chmod +x /pfad/zu/deinem/repo/.git/hooks/prepare-commit-msg
   ```

### Globale Installation

Um den `prepare-commit-msg` Hook global für deine Repositorys verfügbar zu machen, kannst du den Hook in ein Verzeichnis legen und Git anweisen, diesen für alle Repositories zu verwenden:

1. **Verzeichnis für globale Hooks erstellen:**
   ```bash
   mkdir -p ~/.git-hooks
   ```

2. **Hook-Skripte kopieren:**
   Kopiere die gewünschten Hook-Skripte in das Verzeichnis `~/.git-hooks`:
   ```bash
   cp git-hooks/* ~/.git-hooks/
   ```

3. **Git konfigurieren, um globale Hooks zu verwenden:**
   Konfiguriere Git, damit es die globalen Hooks verwendet:
   ```bash
   git config --global core.hooksPath ~/.git-hooks
   ```

   **Vorsicht:** Diese Konfiguration betrifft alle lokalen Git-Repositories. Stelle sicher, dass der `prepare-commit-msg` Hook für alle Projekte geeignet ist, bevor du ihn global verwendest.

## Erweiterung

Um das Support-Repository um weitere Hookvorlagen zu erweitern, folge diesen Schritten:

1. **Neuen Hook hinzufügen:**
   Erstelle eine neue Datei im `git-hooks/`-Verzeichnis mit dem Namen des gewünschten Hooks (z.B. `post-commit`).

2. **Skriptinhalt hinzufügen:**
   Füge das entsprechende Skript für den neuen Hook hinzu und mache es ausführbar:
   ```bash
   chmod +x git-hooks/post-commit
   ```

3. **Dokumentation aktualisieren:**
   Ergänze die Beschreibung des neuen Hooks in der `README.md` unter [Verfügbare Hook-Vorlagen](#verfügbare-hook-vorlagen).

## Beitrag leisten

Beiträge sind willkommen! Du kannst das Support Repository klonen und einen Pull Request machen oder eröffne ein Issue für Vorschläge und Verbesserungen.

## API-Schlüssel Einrichten

Einige Hooks benutzen die OpenAI API. Um diese Hooks effektiv zu nutzen, benötigst du einen API-Schlüssel und die Nutzung der API ist leider auch nicht um sonst. Hier sind die Schritte, um einen API-Schlüssel zu erhalten und was du über die Kosten wissen solltest:

1. **API-Schlüssel erhalten:**
   Besuche die [OpenAI API Website](https://beta.openai.com/signup/) und melde dich an, um einen API-Schlüssel zu erhalten. Nach der Anmeldung findest du den Schlüssel in deinem Dashboard unter `API Keys`.

   Hier eine Schätzung der Kosten: Mit einem Budget von 10 USD kannst du je nach verwendetem Modell ungefähr die folgende Anzahl von API-Anfragen stellen:
   - **GPT-3.5-turbo**: etwa 50.000 Anfragen
   - **GPT-4 (8k context window)**: etwa 1.111 Anfragen
   - **GPT-4 (32k context window)**: etwa 555 Anfragen
   - **GPT-3.5 (text-davinci-003)**: etwa 5.000 Anfragen
   - **GPT-3.5 (text-curie-001)**: etwa 50.000 Anfragen

Genaueres erfährst du direkt bei [OpenAI Pricing](https://openai.com/api/pricing/)