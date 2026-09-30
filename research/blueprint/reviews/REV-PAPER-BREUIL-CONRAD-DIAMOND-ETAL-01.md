# REV-PAPER-BREUIL-CONRAD-DIAMOND-ETAL-01: review of the extraction of Breuil–Conrad–Diamond–Taylor, *On the modularity of elliptic curves over Q: wild 3-adic exercises*

**Verdict: accept.** All nine routes are accepted: two Part II routes and seven source routes. Corrections were made in place:
- route 7 re-targeted, and route 9 added;
- route 1's brief corrected;
- five statuses changed from planned to missing;
- two items added and two item statements corrected.

All eight recorded misprints are confirmed, and four new ones, E9–E12, are added.

Reviewer: Claude Code, session `cc-f805bf`, 29 September 2026. Extraction under review: Claude Code `cc-fb70e5` (issue #4510). It had 124 items (17 planned, 107 missing), 8 routes and 8 `sourceIssues`, with status `complete`. `cc-f805bf` appears nowhere in its files.

Source: J. Amer. Math. Soc. **14** (2001), 843–939, doi:10.1090/S0894-0347-01-00370-8.
- **Published version.** The AMS site answered with a Cloudflare challenge, so I used the Internet Archive's copy of the AMS PDF (https://web.archive.org/web/2023id_/https://www.ams.org/journals/jams/2001-14-04/S0894-0347-01-00370-8/S0894-0347-01-00370-8.pdf). It has 97 pages, and its SHA-256 `1e34130e…4cf2` matches the extraction's recorded hash. PDF page n is printed page 842 + n.
- **Author copy.** I also compared Breuil's author copy (https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/STW.pdf, 80 pp.) at each misprint.

## 1. Items

- **Coverage.** I read the paper through, §§1–10.
  - A script collected the 88 numbered statements (Theorem, Lemma, Corollary, Proposition, Conjecture). Every one appears in an item locator on the right page, except [CDT]'s Theorem 6.1.1, which is only cited.
  - The definitions on the way are all items: types, R^D, σ_τ, admittance, FD_{F′/F₀,I}, Σ-filtrations, D^S, Breuil modules, the local fields of §6 and the θ maps.
  - Two cited theorems that the proofs rest on were not items. I added them as missing:
    - **Tate's theorem** ([T, Thm. 4]): p-divisible groups over R are determined by their generic fibre. All three reductions in §§4.4–4.6 use it.
    - **Ekedahl's effective Hilbert irreducibility** ([E, Thm. 1.3]), used in the proof of Theorem 2.2.1.
- **Statements.** I compared all of them with the text, and checked the main theorems and the §§1–4 definitions on page images. They match, apart from these changes:
  - `descent-data-group-schemes` gave the cocycle as [gh] = [g]∘[h]. The paper's condition is [gh] = (^g[h])∘[g] (pp.869, 897). Corrected.
  - `local-field-F-3` copied the printed uniformiser α/β, which is a misprint (E9). Corrected to (α − 1)/β.
  - Route 1's brief stated Theorem 2.1.6 with the I₃-condition. There the hypothesis is on ρ̄ as a G₃-representation. Corrected.
- **Checks redone.**
  - Lemma 2.1.1 through §3.1. The constituents of Ind_{U₀(9)}^{GL₂(Z₃)} 1 give τ₁ exactly one admitted weight, σ_{2,1}, simply.
  - Lemma 2.1.5 through §3.4. The weight is σ′_{{0},−1}.
  - The δ = 1 computation of Lemma 2.3.1: the trace of 1 − ζ is 3 in F₅, and #Ẽ(F₃) = 1 for Y² = X³ − X − 1.
  - The data G(u) and c_π of §§6.1, 6.2 and 6.5.
- **Not redone.** I did not redo the Breuil-module computations of §§7–9, apart from those behind E9–E11.

## 2. Statuses

No item is in the libraries. I searched the pinned declaration index (Mathlib 082e2d3, Tau Ceti f790474) for Breuil, Barsotti–Tate, p-divisible, descent data, Weil–Deligne, inertial types, deformation rings, Hilbert irreducibility, Serre weights, Langlands–Tunnell, local Tate duality and modularity. What exists is only infrastructure that provides no item:
- Tau Ceti's Cartier duality of finite locally free group schemes and its closed subgroup schemes;
- Mathlib's `groupCohomology`;
- the complex character table of GL₂(F_q).

I read every cited layer's description.

**Citations that hold:**
- R19.1 (Galois representations of eigenforms);
- R26.1 and R27.6;
- R29.6;
- R07.1 (closure of subgroups);
- R07.4 (descent data on finite flat groups);
- R08.3 (Kisin's type rings, whose point characterisation is Conjecture 1.1.1);
- R08.6.

**Five that do not, now missing:**
- `breuil-modules`, `thm-5-1-3` and `thm-5-6-1` were cited at R07.4. R07.4 plans Breuil–Kisin modules and names no Breuil S-modules. The accepted review of PAPER-BOXER-CALEGARI-GEE-ETAL-25 records the same gap. They stay in route 4 as a source for R07.4.
- `mod-l-reps-compact` was cited at R07.5, which is Galois-side (inertia characters and finite-flat criteria). It is now routed to R30.2, the smooth mod-p category of GL₂(Q_p).
- `conj-1-3-1` was cited at R30.5, which plans Paškūnas's support and multiplicity statements, not this conjecture. It remains in route 8.

**Missing items I searched for:**
- σ_τ and Lemma 1.2.1 were said to be "not planned". The accepted Part II SmoothRepresentationsPartII plans Henniart's GL₂ types (PAPER-NEWTON-THORNE-21-B route 3), so they belong there.
- The local Tate duality used in Lemma 4.7.1 is planned in tauceti:TauCetiRoadmap/ClassFieldTheory layer 5. This is now noted.
- No other missing item has an owner.

## 3. Routes

1. **Part II of EllipticCurveModularity** (EllipticCurveModularityWild3Adic). Accepted, brief corrected.
   - Nothing in the atlas plans the wild 3-adic types, the S-deformation problems, the Breuil-module computations of §§6–9, or the mod-3/mod-5 switching over Q.
   - The paper's target is Theorem A, so the direction is EllipticCurveModularity's, alongside its accepted sibling Part IIs.
   - The brief states the final theorems. It says that Theorems A and B re-prove R29.6 and R27.6 rather than re-planning them, and it names its imports. These now include route 7, R07.1, IG.2 and Tau Ceti ClassFieldTheory layer 5.
2. **Source, R29.6.** Accepted.
3. **Source, R26.1 and R27.6.** Accepted.
4. **Source, R07.1 and R07.4.** Accepted.
   - §§4.1–4.2, §5 and Tate's theorem belong to the finite flat group scheme roadmap.
   - The accepted Part II WeightZeroCrystallineLiftingRings also plans torsion Breuil modules. The two designs must agree on one owner, and the finite flat group scheme roadmap is the foundational one.
5. **Source, R08.3 and R08.6.** Accepted.
6. **Source, R22.5.** Accepted. Theorems 1.4.1–1.4.2 and the [CDT] corrigenda belong there.
7. **Part II, SmoothRepresentationsPartII.** Accepted, as corrected.
   - It was a source route to R16.3, which plans the local Langlands correspondence but not types.
   - It now coalesces with the accepted owner of types. Its brief states what BCDT add: extended types on Ũ₀(ℓ), the wild cases, and Lemma 1.2.1 in [CDT]'s normalisation.
8. **Source, R30.2 and R30.5.** Accepted.
   - Admittance and Conjecture 1.3.1 are the multiplicity-one precursor of Breuil–Mézard. R30.5 is the only atlas stage that plans Breuil–Mézard statements.
   - The mod-ℓ representations go to R30.2.
9. **Source, IG.2** (added). Accepted. Ekedahl's theorem refines the Hilbert irreducibility that IG.2 plans.

No Tau Ceti roadmap is re-planned.

## 4. Mistakes in the paper: 8 of 8 confirmed, 4 added

**Where I looked for corrections.** Crossref's record for the DOI has no update-to, updated-by or relation field, and a search with `filter=updates:` returns nothing. Breuil's author copy repeats every slip.

**E1–E8.** Each was confirmed on a 300-dpi page image:
- **E1** (p.866): GL₃(F₃).
- **E2** (pp.900–901): γ₄² "of order 3", printed in both §6.3 and §6.4.
- **E3** (p.902): Gal(F′₃/…) printed twice in §6.4.
- **E4** (p.899): "Theorem 5.2.1", and the undefined Γ₁.
- **E5** (p.918): "Theorem 4.4.1" for Theorem 4.5.1.
- **E6** (p.910): γ̂₃(e′_ω) written where γ̂₃(e′₁) is meant.
- **E7** (p.888): the order of the parameters in G(k′; r, a; s, b; f).
- **E8** (p.939): two references labelled [T].

**New misprints.** All four affect nothing.
- **E9** (§6.4, p.902): "π = α/β is a uniformiser for F′₋₃". Here α³ = 4, so α is a unit, while v(β) = 1/4. Hence v(α/β) = −1/4.
  - x = α − 1 satisfies the Eisenstein equation x³ + 3x² + 3x − 3 = 0, so (α − 1)/β has valuation 1/12.
  - The page itself uses N((α − 1)/β) = −3.
  - (α − 1)/β also gives the printed G(0) = −1 and c_π ≡ 1.
- **E10** (§7.4, p.910): γ̂₃(e₁) = H³e₁ + g_{γ₃}e′_ω should read g_{γ₃}e_ω.
  - e_ω and e₁ span a sub-Breuil module preserved by the descent data.
  - The expansion that follows uses e_ω.
- **E11** (proof of Lemma 7.2.6, p.908): the proof is copied from Lemma 7.2.5.
  - It evaluates on ue′ + (b + b′u)e, which is not in M₁, and writes M(2, 1; 2, 1; b + b′u).
  - The element meant is u²e′ + (b + b′u)ue. Redoing the computation with it gives the printed h(0) = h(0)³ − bH′(0)³.
- **E12** (Theorem 4.6.3, p.878): "ρ mod (T²) ≇ ρ̄ ⊗ k[[T]]/(T²)" should read ρ_N mod (T²).

The authors' corrigenda to [CDT] in §10 stay in item `cdt-corrigenda`, as the extraction decided, since they are errata to another paper.

## 5. Checks

`python3 scripts/check_paper.py` passes on the corrected extraction: 126 items (12 planned, 114 missing), 9 routes and 12 `sourceIssues`, each with a review verdict. The report's new section "Corrections by the independent review" lists every change.
