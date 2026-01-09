# Installing Autonome for Codex

Quick setup to enable autonome skills in Codex.

## Installation

1. **Clone autonome repository**:
   ```bash
   mkdir -p ~/.codex/autonome
   cd ~/.codex/autonome
   git clone https://github.com/mtthsnc/autonome.git .
   ```

2. **Create personal skills directory**:
   ```bash
   mkdir -p ~/.codex/skills
   ```

3. **Update ~/.codex/AGENTS.md** to include this autonome section:
   ```markdown
   ## Autonome System

   <EXTREMELY_IMPORTANT>
   You have autonome. Autonome teach you new skills and capabilities. RIGHT NOW run: `~/.codex/autonome/.codex/autonome-codex bootstrap` and follow the instructions it returns.
   </EXTREMELY_IMPORTANT>
   ```

## Verification

Test the installation:
```bash
~/.codex/autonome/.codex/autonome-codex bootstrap
```

You should see skill listings and bootstrap instructions. The system is now ready for use.
