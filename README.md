# Imran Malik — Flutter Web Portfolio

Premium personal portfolio with a downloadable CV, deployable to **GitHub Pages**.

## Local run

```bash
flutter pub get
flutter run -d chrome
```

## Local release build (with CV at site root)

```bash
flutter build web --release --base-href "/"
cp assets/cv.pdf build/web/cv.pdf
```

Then open `build/web/index.html` via a local static server, or:

```bash
cd build/web && python3 -m http.server 8080
```

CV should be available at: `http://localhost:8080/cv.pdf`

## GitHub Pages deployment

### 1. Push the project

```bash
git add .
git commit -m "Configure GitHub Pages deployment with downloadable CV"
git push origin main
```

### 2. Enable Pages

1. Open the repo on GitHub → **Settings** → **Pages**
2. Under **Build and deployment** → **Source**, choose **Deploy from a branch**
3. Branch: **gh-pages** / folder: **/ (root)** → Save

The workflow in `.github/workflows/deploy.yml` builds on every push to `main`, copies `assets/cv.pdf` → `build/web/cv.pdf`, and publishes the `gh-pages` branch.

### 3. Live URLs

- Site: `https://<YOUR_GITHUB_USERNAME>.github.io/<REPO_NAME>/`
- CV: `https://<YOUR_GITHUB_USERNAME>.github.io/<REPO_NAME>/cv.pdf`

## Content & CV

| Item | Location |
|------|----------|
| CV PDF | `assets/cv.pdf` |
| Contact / links | `lib/data/portfolio_data.dart` |
| Download button | Navbar / Footer → `openCv()` |

Replace `YOUR_GITHUB_LINK` in `portfolio_data.dart` with your GitHub profile URL when ready.
