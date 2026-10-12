# BP-HeightsRationalPointsAndObstructions — complete pass

Agent: Claude (Opus 5.5), session claude-J5kQOo, 2026-10-12. Refs #1031 (claim comment 6130244865,
confirmed by the bot). This pass continues the two merged checkpoints (Codex codex-hjdg0j,
2026-09-27; Claude Code cc-fb70e5, 2026-09-28), keeps their 24 nodes, and plans every stage in
scope.

## Result

- **Packet** `research/blueprint/packets/HeightsRationalPointsAndObstructions.json`, status
  `complete`: 144 nodes (25 definitions, 24 constructions, 65 theorems, 22 lemmas, 7 applications,
  1 comparison), 286 API items, 205 unit tests, 36 planets (at most six per layer), 100 baseline
  declarations, 10 requests, 8 gaps. `check_blueprint.py` against the pinned declaration index:
  0 errors, 0 warnings.
- **Coverage.** All seven stages RP.0–RP.6 are `planned`; each record lists the refinements left
  (decomposition of cited deep proofs, Ingram's quasi-finite comparison for ArithmeticDynamics,
  Néron symbols for GrossZagier GZ.0).
- **Reader document** `research/blueprint/readmes/HeightsRationalPointsAndObstructions.md`:
  introduction, boundaries, conventions, sources, then every layer with an overview and every
  node (statement, hypotheses, proof sketch, uses, API and unit-test tables, checks, dependencies
  in this roadmap, other roadmaps and the libraries, sources), the stage acceptance tests,
  requests, gaps, restructuring, coverage, source corrections and baseline declarations. It is
  rendered from the packet, so the two agree.
- **Suggested file** `research/blueprint/suggested/HeightsRationalPointsAndObstructions.lean`
  (2,394 lines). **Compiled** with `lean-check` in the shared build at Mathlib 082e2d3 and Tau Ceti
  f790474: no errors, `sorry` the only warning (343 of them). It repairs the 11 elaboration errors
  of the earlier RP.2 section. Of the 601 packet names (API items, unit tests and theorem
  declarations), 337 are typed declarations or `example`s; the other 264 are listed by name with
  their statements in the closing comment "Statements not typed at the pins", because their
  carriers are absent at the pins (ampleness and pullback of line bundles, Cartier divisors and
  intersection numbers on models, abelian schemes over bases, integral models of curves, total
  spaces of torsors, unramified and relative Brauer groups, zero-cycles, Jacobians). No `Prop`
  stand-in is used; the data stand-ins (`GaloisH1`, `SchemeBrauer`, `localInv`, `TorsorH1`,
  `FieldH1`, `Curve.genus`, line-bundle pullbacks) are marked as owned elsewhere.

## The layers

- **RP.0** (35 nodes). Heights over Conrad's generalized global fields, expressed through Mathlib's
  `Height.AdmissibleAbsValues`, so that number fields and polarized function fields are one
  theory: normalised height, extension invariance, tuple adapters (Tsimerman), Northcott on
  projective space for bounded degree (Mathlib leaves the projective case as a TODO), the Weil
  height machine with values in the checkpoint's `HeightClass`, positivity off the base locus,
  Northcott for ample bundles, Tate's limit (real body), the Néron–Tate height of any line bundle,
  its kernel (Northcott only), bilinear form and Néron functions; Silverman–Tate, the duplication
  estimate, model independence, Silverman's limit and dominant-map theorems; function-field heights
  of subvarieties (Xie–Yuan, Gubler) with their laws, base change, model comparison and the
  good-reduction formula.
- **RP.1** (18). Kummer maps (fppf, Galois when the degree is invertible), unramified local images,
  Selmer and Ш as the EllipticCurves Layer 7 constructor applied to A[φ], descent sequence,
  finiteness, weak Mordell–Weil, Mordell–Weil through Mathlib's descent theorem, positive
  definiteness, the K/k-trace, Lang–Néron and the function-field kernel, two-coverings, W[2] and
  2-Selmer sets (Bhargava–Gross–Wang), local indices of [2], injectivity of reduction on torsion,
  the 2-isogeny Kummer formula and a complete 2-descent of y² = x³ − x.
- **RP.2** (35). The affine checkpoint plus adelic points of separated schemes, scheme Brauer
  evaluation (on `SchemeAndStackFoundations:key/scheme-brauer`), local constancy, the general
  Brauer–Manin pairing and set, closedness, functoriality, Br₀/Br₁, Br_nr, B_ω, the unramified
  pairing on the full product, the zero-cycle pairing, Harari's formal lemma, cyclic algebras and
  the cyclic norm principle (Skorobogatov–Sofos), complete intersections of dimension ≥ 3
  (Browning–Le Boudec–Sawin), conics, Iskovskikh's surface and the finite computation of a
  Brauer–Manin set.
- **RP.3** (21). Torsor evaluation and twisting, the descent partition, Selmer sets, local finiteness,
  descent sets, descent ⊆ Brauer–Manin, the étale–Brauer set and étale–Brauer = descent (with Cao's
  iteration), universal torsors and descent under tori, Harpaz–Wittenberg's unramified descent for
  torus torsors (relative Brauer group, edge maps, residual functional, Theorem 2.1, Corollary 2.2,
  existence of universal torsors), genus-one torsors and Weil–Châtelet, the BGW Hasse failures,
  Poonen's worked descent, Minchev's theorem and the insufficiency examples.
- **RP.4** (9). Good reduction of curves and Shafarevich sets, Chevalley–Weil, de Franchis, the
  Kodaira–Parshin construction, Parshin's implication, Faltings' theorem by this route, integral
  points and Siegel's theorem (Corvaja–Zannier via DT.2), and the function-field Mordell conjecture.
- **RP.5** (20). Abelian subvarieties, cosets and quotients, stabilizers, the generated abelian
  subvariety, the Ueno locus, finite-rank groups, Manin–Mumford (characteristic 0, trivial trace in
  all characteristics, uniform), Faltings' subvariety theorem, Vojta's inequality and Mumford's gap
  principle (the Bombieri route to Faltings' theorem), Mordell–Lang, the Faltings–Zhang map and
  Zhang's lemma, the minimal torsion coset, the essential minimum, Bogomolov (Ullmo–Zhang), SUZ
  equidistribution and coset-free hypersurface sections.
- **RP.6** (6). Local solubility and the Hasse principle, the Abel–Jacobi transfer, the genus 0, 1
  and ≥ 2 classifications, and the register of conjectures (propositions with no proved consumer).

## Confirmed red-team finding RT-AREA-iwasawa-1/3

Handled as the finding asks, on this side: RP.0 now plans the line-bundle height machine
(`RP.0/weil-height-machine`), the canonical limit (`RP.0/tate-limit`, `RP.0/neron-tate-height`),
positivity and the torsion characterisation from Northcott alone, with no finite generation
(`RP.0/neron-tate-kernel-number-field`), and RP.1 plans Mordell–Weil for abelian varieties
(`RP.1/weak-mordell-weil`, `RP.1/mordell-weil`) with the height half reduced to Mathlib's
`CommGroup.fg_of_descent'` in its additive form `AddCommGroup.fg_of_descent'`. The narrowing of
GrossZagierAndArithmeticHeights GZ.1 (YZZ normalisation, Poincaré pairing A × A∨, χ-component
pairings), the edges RP.0 → GZ.1 and RP.1 → GZ.1, and rerouting RankZeroOneBSD BSD.1 to RP.1 are
recorded in `restructure` for the maintainer; this job does not edit `data/` or other packets. GZ.1
has no packet yet, so nothing there needs reverting.

## RS-03

Accepted (review 2026-09-30). RP.0, RP.1 and RP.3 are planned exactly as far as RS-03 keeps them:
the elliptic canonical height, elliptic Mordell–Weil and 2-descent, the abstract Selmer structure
and the pointed-twist classification are imported from TauCetiRoadmap EllipticCurves Layers 5–7,
with comparison nodes and tests (factor-of-two convention: Tau Ceti's `canonicalHeight` already
halves the x-height, so it equals ĥ_{K,O(O)}; the unhalved bilinear form is twice
`neronTatePairing`).

## Routed papers: item → node

- YUAN-26/129 → RP.0/normalized-height. TSIMERMAN-18/algebraic-point-height → RP.0/tuple-height-adapters,
  normalized-height; /northcott-finiteness → RP.0/northcott-projective.
- DIMITROV-GAO-HABEGGER-21/5 → RP.5/finite-rank-subgroup; /13 → RP.5/faltings-zhang-map; /28 →
  RP.0/fibrewise-height-model-independence; /35 → RP.0/duplication-by-quartics; /39 →
  RP.0/silverman-tate; /40 → RP.0/family-duplication-estimate.
- GAO-HABEGGER-19/3 → RP.1/kk-trace; /4 → RP.1/lang-neron; /5 → RP.0/geometric-height-field,
  model-mk-height-comparison; /6 → RP.1/function-field-neron-tate-kernel; /16 →
  RP.0/duplication-by-quartics; /19 → RP.5/uniform-manin-mumford; /52 → RP.5/stabilizer; /63 →
  RP.0/silverman-dominant-map-inequality; /65 → RP.0/silverman-tate; /67 →
  RP.0/silverman-specialization-limit; /73 → RP.5/ueno-locus; /74–/75 →
  RP.5/coset-free-hypersurface-sections.
- XIE-YUAN-22: projective-model → RP.0/geometric-height-field, geometric-subvariety-height;
  naive-height, canonical-height → RP.0/geometric-subvariety-height; height-quadratic-bound →
  RP.0/neron-tate-bilinear-form (`neronTateHeight_sum_le`); good-reduction-height →
  RP.0/good-reduction-height-formula; northcott-trivial-trace → RP.1/function-field-neron-tate-kernel;
  trace → RP.1/kk-trace; quotient-minimal-torsion → RP.5/abelian-subvariety,
  minimal-torsion-subvariety; manin-mumford → RP.5/manin-mumford-positive-characteristic (derived
  from Scanlon Theorem 2.2 for all torsion, as the review of the extraction asks);
  height-properties → RP.0/geometric-height-laws; height-base-change →
  RP.0/geometric-height-base-change; model-mk-height → RP.0/model-mk-height-comparison.
- GAO-GE-KUHNE-26/4 → RP.5/finite-rank-subgroup; /5–/6, /86, /88 → RP.5/ueno-locus; /7, /31, /32 →
  RP.5/generated-abelian-subvariety; /26 → RP.0/neron-tate-height (`neronTateHeight_eq_of_algEquiv`);
  /65 → RP.5/zhang-difference-lemma.
- HARPAZ-WITTENBERG-23/29 → RP.2/unramified-brauer-group; /31 → RP.2/unramified-pairing-full-product;
  /38 → RP.2/algebraic-brauer-group; /61 → RP.2/b-omega.
- HARPAZ-WITTENBERG-20 (RP.2): /14 → RP.2/algebraic-brauer-group, unramified-brauer-group; /18 →
  RP.2/adelic-points-general; /19 → RP.2/brauer-manin-general; /25 → RP.2/zero-cycle-brauer-pairing;
  /50 → RP.2/formal-lemma. (RP.3): /20 → RP.3/torsor-evaluation; /32, /34 →
  RP.3/relative-algebraic-brauer; /36–/40 → RP.3/edge-map-twist-independence; /42, /49 →
  RP.3/unramified-torus-descent; /43 → RP.3/torus-descent-brauer; /44–/45 →
  RP.3/residual-sha-functional; /51–/52 → RP.3/open-torus-torsor-descent; /94 →
  RP.3/brauer-manin-universal-torsor-existence.
- SKOROBOGATOV-SOFOS-23/59 → RP.2/cyclic-norm-class; /60 → RP.2/cyclic-norm-one-place; /68 →
  RP.2/product-norm-assembly. BROWNING-LEBOUDEC-SAWIN-23/brauer-trivial →
  RP.2/brauer-trivial-complete-intersections.
- BHARGAVA-GROSS-WANG-17/3 → RP.1/two-coverings; /4 → RP.1/w2-odd-factorizations; /5 →
  RP.1/selmer-set-two-covering; /15 → RP.3/bgw-hasse-failures.

## Ownership, tiers and notions moved down

- **Tate's limit** moves down from ArithmeticDynamics DY.1 (which consumes RP.0) to RP.0/tate-limit;
  DY.1/tate-limit and its six lemmas should cite it (restructure proposal).
- **Faltings' theorem.** RP.4 owns the Kodaira–Parshin construction, de Franchis and the conditional
  implication (no upward citation). `RP.4/mordell-faltings` cites FaltingsFinitenessAndIsogenyTheorems
  R28.5 (tier 17), an upward citation for this tier-9 roadmap: at packaging time the unconditional
  assembly moves into R28.5, whose `mordell-conjecture-by-the-parshin-construction` should cite
  RP.4/kodaira-parshin-construction and RP.4/parshin-implication. The theorem is one declaration
  shared with MordellLawrenceVenkatesh LV.11/faltings-theorem and RP.5/vojta-bombieri-mordell.
- **Bogomolov.** Its equidistribution input needs arithmetic intersection theory of adelic metrized
  line bundles, which no roadmap plans (gap); proposed owner "ArakelovGeometryAndAbelianHeights,
  Part II: adelic line bundles and equidistribution".
- **Consumers served.** ArithmeticDynamics' three requests (height machine, Néron–Tate height,
  commensurability), EffectiveDiophantineMethods' (Mordell–Weil, Néron–Tate, local Néron heights with
  Silverman's normalisation as a test of RP.0/local-weil-functions, the 2-isogeny Kummer formula,
  local indices of [2], reduction on torsion), ArithmeticStatistics ST.4 (two-cover Selmer sets,
  local indices), AnabelianGeometry NC.5 (Mordell–Weil), ErdosProgressionPowers (Faltings) and
  GrossZagier GZ.0 (height machine, canonical limit, Mordell–Weil). Not yet a node: Ingram's
  quasi-finite comparison (ArithmeticDynamics DY.6) and the Néron symbols for degree-zero divisors
  (GZ.0; left to GZ.2's arithmetic intersection theory).

## Requests (10)

ClassFieldTheory Layers 5, 10, 13 (local invariants with corestriction and cyclic algebras;
reciprocity, ABHN, H³(K, 𝔾_m) = 0; the cyclic Hasse norm theorem); EllipticCurves Layers 5, 6, 7;
GlobalQuadraticForms Layer 5; JacobianChallenge Layer F; FaltingsFinitenessAndIsogenyTheorems R28.5
(Korollar 1 to Satz 6); SchemeAndStackFoundations SF.2 (Gabber–de Jong: Br_Az = Br' for
quasi-projective schemes, needed by Poonen Proposition 8.5.3; SF.2 has δ_X and Br' but not the
comparison).

## Gaps (8)

Arithmetic intersection theory of adelic metrized line bundles (SUZ, Bogomolov); Faltings' proof of
the subvariety theorem in dimension > 1 and McQuillan's division-point theorem; proofs of
Manin–Mumford (Raynaud, Hindry); the Ueno-locus structure theorems (Kawamata, Bogomolov, Rémond,
read only through Gao–Ge–Kühne and Gao–Habegger); Manin's identification of the Cassels–Tate
pairing with the Brauer–Manin pairing; unread standard sources for local facts (Mattuck, Katz);
compactness of O_v for a number field (kept from the second checkpoint; no instance in the pinned
index); the function-field Mordell proofs. The earlier gaps "Azumaya versus cohomological Brauer
group" and "Henselian local rings" are now the SF.2 request and the SF.2/brauer-henselian-local
supplier.

## Sources

Read (URLs, SHA-256 and access date in the packet's `sources` and `sourceVersions`): Conrad,
Chow's K/k-image and K/k-trace (§§3, 6–10); Poonen, Rational points on varieties (the sections listed
in the packet); Milne, Abelian Varieties (IV §§1, 5); Szpiro, Bourbaki 619 (§§1, 2.1, 5.2–5.3);
Bombieri 1990 (§§1–5, 10); Gubler 2007 (§§1–5); Ullmo 1998 (§1); Scanlon 2005 (Theorem 2.2);
Česnavičius (Theorems 1.1–1.3, from the cleared library); the arXiv or author copies of Gao–Habegger,
Dimitrov–Gao–Habegger, Gao–Ge–Kühne, Xie–Yuan, Harpaz–Wittenberg 2020 and 2023 and
Bhargava–Gross–Wang, against which the theorem numbers and pages of the reviewed extractions were
checked. Not re-read: Yuan 2026, Tsimerman 2018, Skorobogatov–Sofos 2023, Browning–Le Boudec–Sawin
2023 (locators from their reviewed extractions). Not available: Corvaja–Zannier 2002 (publisher
refused the download), Bombieri–Gubler, Mattuck 1955, Katz 1981, Faltings 1991, Skorobogatov's
book (none freely available nor in the cleared library). No new source issues were found beyond the
eight recorded by the earlier checkpoints (kept).

## Resume

The follow-ups are the refinements in the coverage records and the gaps above; the restructuring
proposals (GZ.1 narrowing, DY.1 Tate limit, Faltings assembly into R28.5, the Arakelov Part II,
RP.6 scope, sub-layers of RP.0 and RP.2) are for the maintainer.
