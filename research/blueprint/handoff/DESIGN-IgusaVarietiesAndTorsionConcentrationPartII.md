# Handoff: DESIGN-IgusaVarietiesAndTorsionConcentrationPartII (issue #3413)

Worker: Claude (session claude-C9OuE6), 2026-10-19.

## What was delivered

- `research/blueprint/roadmaps/IgusaVarietiesAndTorsionConcentrationPartII.json` — the new roadmap
  "Igusa varieties, compactified period fibers and torsion concentration, Part II: compact unitary Shimura
  varieties", area `langlands`, parent `IgusaVarietiesAndTorsionConcentration`, four layers IG.8–IG.11
  (numbering continues the parent's IG.0–IG.7).
- `research/blueprint/packets/IgusaVarietiesAndTorsionConcentrationPartII.json` — status `complete`; 28 nodes
  (3 definitions, 3 constructions, 19 theorems, 3 lemmas), 38 API items, 28 unit tests, 17 planets
  (IG.8: 5, IG.9: 3, IG.10: 4, IG.11: 5), 9 baseline declarations read at the pins, 1 gap, 1 request,
  3 restructure proposals, 1 new source issue (E1) and 20 inherited corrections of PAPER-CARAIANI-SCHOLZE-17.
  `python3 scripts/check_blueprint.py` (with the pinned declaration index): 0 errors, 0 warnings.
- `research/blueprint/readmes/IgusaVarietiesAndTorsionConcentrationPartII.md` — the reader document, rendered
  from the packet (about 17,500 words), with hand-written scope, conventions and layer introductions; checked
  with markdown-it for stray emphasis and accidental links (none).
- `research/blueprint/suggested/IgusaVarietiesAndTorsionConcentrationPartII.lean` — 251 lines, namespace
  `TauCetiRoadmap.IgusaVarietiesAndTorsionConcentrationPartII`. **Compiled** with `lean-check` at Mathlib
  082e2d3 / Tau Ceti f790474: exit 0, only `sorry` warnings (19), no sorry'd data definitions. It states the
  arithmetic shadows that exist at the pins (signature data and the dimension, the Hecke polynomial and the
  effect of the Hecke involution on its roots, decomposed genericity and the auxiliary-pair condition on
  Frobenius eigenvalues) and lists every other packet name under "Statements not typed at the pins".

## Scope decisions

- The brief combined two continuations. Only the compact unitary endgame of Caraiani–Scholze 2017
  (PAPER-CARAIANI-SCHOLZE-17, 15 items) is planned. The Boxer–Pilloni direction (ordinary Igusa formal schemes
  of Siegel varieties, PAPER-BOXER-PILLONI-26, 31 items) shares no layer with it (its own brief says so) and is
  proposed as a separate roadmap in the packet's `restructure` (action `split`).
- Already owned by the parent package and cited, not re-planned: CS17 Theorem 4.4.4 (parent IG.3
  `compact-fibre-theorem`), Proposition 6.1.3 and Corollary 6.1.4 (parent IG.4 `compact-perversity`,
  `compact-minimal-stratum-concentration`), Lemma 6.2.2 (parent IG.5 `generic-lift-splits`, over any finite
  extension of ℚ_p), Mantovan Igusa varieties and Igusa Poincaré duality (parent IG.1, IG.5).
- Owned by EndoscopicTransferAndUnitaryTraceComparison in the needed generality and cited: Shin's stable Igusa
  trace formula for PEL type (A) (`ET.5/stable-trace-with-normalizations`), the stable–twisted identity for every
  rank and archimedean signature (`ET.4/stable-twisted-identity`), the archimedean Lefschetz functions, Newton
  reduction and Lemma 5.4.2 (`ET.7b/newton-reduction`, `ET.7b/red-trace-duality`), the Frobenius-twist extension
  (`ET.5/central-shift-character-separation`), Badulescu's principal-series nontransfer (`ET.6`).
- Owned here because ET.7b states them only for the rank-2n quasi-split datum of the non-compact sequel: the
  compact rank-n versions of CS17 Theorem 5.3.2 and Lemma 5.5.1 / Corollary 5.5.2 (IG.9.1, IG.9.3). Recorded as a
  `rescope` proposal: if ET widens ET.7b, these two nodes become citations.
- Owned by BunGAndNewtonStrata and cited: Lemma 5.5.8 (`BG1/gl-minuscule-quasisplit-centralizer`), the ordinary
  class, products and unramified restriction of scalars. Note for packaging: BunGAndNewtonStrata is outside the
  Caraiani–Newton order; the parent package moved the B(G) material it needs into its own IG.0/IG.F. A package of
  this Part II should either cite the parent's IG.0.1–IG.0.2 and plan Lemma 5.5.8 and the product/restriction
  identification itself, or wait for BunGAndNewtonStrata upstream.
- Owned by AutomorphicGaloisRepresentationsPartII and cited: Corollary 5.5.5 and Remark 5.5.6
  (`AG2.2/cs-discrete-polarization-normalization`, `AG2.7/unitary-discrete-parameter-export`), decomposed
  genericity over arbitrary p-adic fields (`AG2.7/strong-local-decomposed-genericity`), dual Galois-type ideals at
  rank n (`AG2.7/dual-and-character-twist-hecke-comparison`), Chebotarev for generic primes.

## What remains

- **Gap (IG.10.4 and the Case 1 end theorems).** CS17 §5.6 (p. 749; same in arXiv v1) attributes stable base
  change for Kottwitz's simple Shimura varieties to Shin's appendix to Goldring (Compositio 2014). That
  appendix's Theorem 1.1 (author copy read, `https://math.berkeley.edu/~swshin/BCofU.pdf`) is stated for unitary
  similitude groups of hermitian forms on F^n, i.e. B = F; the division-algebra case also needs the global
  Jacquet–Langlands correspondence for GL_m(D). Recorded as sourceIssues E1 (new), a gap, and a request to
  AutomorphicGaloisRepresentationsPartII AG2.2 (to which the paper route assigned item 156). Case 2 does not
  depend on it. Kottwitz 1992 (Invent. Math. 108) and Labesse's CM base change paper were not read (not freely
  available or not located).
- Coverage: all four stages `planned`; `remaining` lists only lemma-level refinements, the possible re-pointing
  to ET.7b, and the Case 1 gap.

## Moves and requests for other roadmaps

- Request: AutomorphicGaloisRepresentationsPartII AG2.2 — base change and Galois representations for the
  division-algebra unitary groups of arbitrary signature (see packet `requests`).
- Proposal (split): a new design job `DESIGN-IgusaVarietiesAndTorsionConcentrationPartIISiegelOrdinary` with the
  PAPER-BOXER-PILLONI-26 route.
- Proposal (rescope): ET.7b's three CSnc-specific nodes could be stated for general data quasi-split at finite
  places, replacing IG.9.1/IG.9.3 here.

## Sources read

- Caraiani–Scholze, Ann. of Math. 186 (2017), published PDF (sha256 4f9449e5…), §1, §5, §6 and references
  (journal pages are the locators).
- arXiv:1511.02418v1 (sha256 aa93df39…), §5.6 only, to check E1 against the preprint.
- Shin, appendix to Goldring (author copy, sha256 6bfc5628…), all 5 pages.
- Supplier packets and packages read for the nodes cited: the parent package README and packet (IG.0–IG.7),
  EndoscopicTransferAndUnitaryTraceComparison package Layers 6, 8, 9, 10, 14 and packets ET.0–ET.7b,
  AutomorphicGaloisRepresentationsPartII packets AG2.0/AG2.6, BunGAndNewtonStrata, PELModuli,
  ShimuraCompactifications, PerfectoidShimuraVarieties, AutomorphicSpectralTheory, ArithmeticLocallySymmetricSpaces,
  EtaleDualityAndPerverseSheaves, ClassicalAdicEtaleCohomology, DiamondEtaleCohomology, SchemeAndStackFoundations,
  ArithmeticGaloisDuality, ArithmeticGaloisRepresentations, AlgebraicModularFormsAndSerreWeights,
  AutomorphicLFunctionsAndLocalFactors, IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups.

## Sources missing

- Arthur, The L²-Lefschetz numbers of Hecke operators (Invent. Math. 1989) and Shin, On the cohomology of
  Rapoport–Zink spaces of EL-type (Amer. J. Math. 2012): cited through CS17 and AutomorphicSpectralTheory AS.6;
  not read here.
- Kottwitz 1992 (Invent. Math. 108) and Labesse, Changement de base CM et séries discrètes: relevant to the E1 gap,
  not read.
