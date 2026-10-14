# Heights package, revision 2: partial checkpoint

Issue: #9836. Worker: Codex, session `codex-MH3SBK`, 2026-10-14.
Branch: `codex-MH3SBK-heights-package`.

**Status: partial; not ready for upstream or package acceptance.** The README
now has owned targets for many previously implicit proof inputs, but the
connected-group descent and full function-field curve routes remain open.
The new deep proof outlines also need a complete closure audit before anyone
asserts that the other review findings are resolved. A successful Lean check
does not certify those outlines.

The source-access blocker is the general global-function-field connected-group
finiteness theorem in §3.3b. Conrad's public proof reduces to pseudo-reductive
classification, including the characteristic-two case. The required
Conrad–Gabber–Prasad monograph is neither freely accessible nor present in the
maintainer's cleared-library index. The public structure survey does not give
the needed classification proof. No uncleared copy was used. Obtaining access
would still leave substantial target decomposition: citing the classification
as a black box is not closure. Harder's simply connected function-field H¹
theorem is another prerequisite, distinct from the number-field supplier.

## Changes and preservation

Only the package README and this handoff change. `Suggested.lean` and
`metadata.toml` were checked and retained. The accepted packet, its reader,
`review.json`, the review report and all other jobs' files remain untouched.
The preceding independent `needs_changes` verdict remains authoritative.

All **139 original numbered targets** and the **eight imported boundary
interfaces** remain. There are **76 additional numbered proof subsections**.
The document retains definition APIs, discriminating Checks, examples and
source locators. New material is written in our own words, organized around
the mathematical dependencies, without source passages or source-by-source
summaries. The README's opening proof-route map distinguishes the explicitly
unclosed inputs from the new constructions.

Substantive corrections made while adding targets include:

- General quotient A/B is constructed from a Poincaré complement and the
  existing finite-kernel quotient; stabilizers use the Hilbert scheme.
- Lang–Néron uses curve finite étale H¹ and bounded graph families before
  height-kernel positivity. The Euclidean positivity argument handles an
  irrational null direction by lattice approximation.
- Smooth formal identity charts apply to a Néron model at bad reduction too.
- Function-field finite torsors use bounded **differents** at bad places;
  bounded ramification support alone would fail for Artin–Schreier classes.
- Brauer purity is scoped to smooth characteristic-zero varieties through
  complex comparison, without claiming general mixed-characteristic purity.
  Removing the origin from a two-dimensional affine space preserves H², but
  its H³ with finite coefficients need not vanish.
- The connected-cover comparison uses Cao's corrected finite-coefficient
  decomposition; algebraic Brauer product splitting does not follow from
  injectivity after a finite extension. The latter assertion was removed.
- The type-existence obstruction in Sha² is separated from the degree-one
  twisting functional. Nonconstant units require the extended complex.
- The abelian Brauer comparison uses classes mapping to H¹ of the dual's
  n-torsion, rather than simply equating that condition with Br[n]. Real
  Tate corrections and divisible Sha obstructions remain visible.
- The finite-projection grid bound in the product theorem depends on both
  degree and ambient dimension. Samuel's normalization argument retains
  the separable and purely inseparable field extensions separately.
- Voloch's polynomial normalization uses a change with exponent m satisfying
  mn+1 ≡ 0 mod p; an arbitrary leading coefficient cannot just be divided
  away while preserving p-th-power values.
- Arithmetic-cycle heights retain the Green-current correction. The singular
  Hilbert–Samuel squeeze applies its theorem to two positive auxiliary
  bundles, rather than applying it to an uncontrolled negative bundle.
- Corrected the stable-reduction owner to the existing
  `TauCetiRoadmap.StableReduction`; corrected Cao's 2018 title and its
  corrigendum locator; replaced the broken Skorobogatov link with the
  published author-hosted PDF.

## Disposition of the 17 review findings

“Added” below means a statement/API/Checks/proof route was written. It does
**not** mean an independent review has accepted closure. Preserve the precise
old findings in `REV-PKG-HeightsRationalPointsAndObstructions.md` when resuming.

| Finding | Work in this checkpoint | Remaining work |
| --- | --- | --- |
| 1. Adelic arithmetic intersections | §§5.17a–g: arithmetic divisor action, model limits, positive-line spectral estimate, Hilbert–Samuel, norm-controlled lifting, successive minima, metric variation. | Audit every analytic and algebraic prerequisite against the stated lower owners, especially the spectral estimate and norm lifting. Verify arbitrary-dimensional singular horizontal cycles throughout. |
| 2. Higher-dimensional/finite-rank Faltings | §§5.9a–f: index/product theorem, finite projections, small sections and dimension descent. §§5.13a–c: division control and specialization. | Check the product theorem's quantitative inequalities, uniform constants and every Hilbert/specialization adapter. The curve theorem is not a replacement. |
| 3. Manin–Mumford | §§5.6a–d: characteristic-zero p-adic/difference route. §§5.7a–d: connected formal Dieudonné and invariant-subvariety route. §5.8a: constructibility/compactness uniformity. | Full closure audit of the scoped Dieudonné/slope and positive-characteristic rigidity arguments remains necessary. Keep geometric trace and all torsion; no silent prime-to-p replacement. |
| 4. Ueno structure/bounds | §§5.4a–c: maximal-coset degree bound, finite lattice directions, proper incidence images and closedness. | Verify Rémond's degree estimate and the finiteness/parameter-space implications with exactly the polarization used. |
| 5. Cassels–Tate/Brauer | §§3.17a–d: biextension pairing, finite-level Poitou–Tate, annihilator/divisibility, Pic⁰ Brauer and multiplication covers. | Check the diagram/cochain comparison and real-place correction in full; Milne's cross-reference to González-Avilés was not followed through its complete proof. General multiplicative-type compact-support comparison below is also open. |
| 6. Compact completion integers | Existing current Tau Ceti owner retained. | None to construct; do not replan it. |
| 7. Function-field Mordell | §§4.9a–c: jet contraction, Samuel/Frobenius descent, normalization and finite-constant-field genus-change route. | **Open:** genus-tower stabilization and the arbitrary-constant-field extension in the regular-curve, geometric-genus-drop case. The finite-constants argument does not prove the full target. |
| 8. Geometric suppliers | §§1.0,5.2 quotient/stabilizer; §0.15a local presentation estimates; §0.29a generic-trivial descent. | Check exact Hilbert/Picard/normal-base hypotheses and representability, without importing an unexplained “proper group space hence scheme” assertion. |
| 9. Lang–Néron | §§1.9a–c,1.10a: prime-to-p H¹, bounded graphs, curve joining and higher-dimensional degree control before positivity. | Audit boundedness and constancy modulo trace, especially extension from curves; do not reintroduce the height-kernel cycle. |
| 10. Global function fields | §2.3a models/adelic direct limit/proper compactness; §3.3a finite torsors with bounded different; §3.3b conditional component adapter. | **Open:** `connectedShaOutside_finite` for inner twists and finite extensions. Number fields need the reductive adapter to AA.3/AA.4.1; function fields need Harder and imperfect-field pseudo-reductive structure theory. |
| 11. Descent/type/existence | §§3.8a–f: finite-cover domination, integral lifting, iteration, extended types, compatible covers and corrected invariant Brauer decomposition. §§3.9a–c: ordinary type, torus duality, evaluation. | **Open:** connected-group Poitou–Tate, coflasque resolution, adjoint-group kernel, simply connected central-boundary surjectivity, and nonconstant-units compact-support comparison. See next section. |
| 12. Bombieri product/Roth | §§5.10a–e: derivative/index, small section, norm polynomial, Roth and gap assembly. | Check Bombieri's §§6–9 estimates against the 1991 erratum; retain the codiscriminant term and chosen height normalization. |
| 13. Effective computation | Existing existence/algorithm boundary retained. | No new terminating algorithm claimed; leave computational certification at EffectiveDiophantineMethods. |
| 14. Gabber/purity/Lefschetz/CH₀ | §§2.6a–d twisted modules/stabilization/Gabber; §§2.16a–b and 2.17a characteristic-zero purity/all DVR; §2.19a curve reciprocity; §§2.25a–b Morse/Lefschetz. | Audit all exact hypotheses. Do not extrapolate to arbitrary regular mixed-characteristic schemes, or use curve normalization for higher-dimensional compactification. |
| 15. Subspace adapter | §4.7a names the product-form adapter with finite exponent partition, determinant and local-degree normalization. | Audit against DiophantineApproximationAndTranscendence §2.8, retaining arbitrary number field. No new Subspace theorem is needed. |
| 16. Formal lemma | §§2.20a–c: finite Brauer quotient, auxiliary Frobenius places, compensation. | Check residue detection, fresh-place choice and finite-character compensation; the finite quotient, rather than finiteness of the entire Brauer subgroup, is essential. |
| 17. Smooth formal charts | §§1.15a–b: complete smooth identity chart, g-dimensional formal law, deep ideal balls and topology. | Check all-reduction Néron hypotheses against the lower mapping/model owner. Katz/Mattuck are checked analytic sources, not substitutes for this adapter. |

## First restart: the actual open chains

1. **§3.3b connected finiteness.** Read Conrad, *Finiteness theorems for
   algebraic groups over function fields*, Theorem 1.3.3, p.5, and §§6.1–6.4,
   pp.32–40. Separate commutative groups, unipotent radicals, generalized
   standard pseudo-reductive presentations, and basic exotic cases in
   characteristics 2 and 3. Acquire authorized access to the classification
   source, or find a primary proof of exactly this finiteness input which
   avoids it. The survey is not enough. For number fields Borel–Serre §7,
   pp.158–162, uses reduction theory; connect its reductive kernel proof to
   AdelicAlgebraicGroups AA.3 and AA.4.1 explicitly. The component argument is
   conditional on this input and is not its proof.
2. **§3.8f invariant-Brauer lifting.** Cao 2018 §5 uses surjectivity of
   H(𝔸)→Brₐ(H)ᴰ when Sha(H)=0, an enlargement by a coflasque resolution,
   vanishing for the adjoint kernel, and a torus-fibration lifting theorem.
   The underlying connected-group Poitou–Tate proof of Demarche and the
   Cao–Demarche–Xu fibration proof were not read completely in this run.
   Identify/decompose their nonroutine inputs. Borovoi's nonabelian H²
   argument additionally uses the surjectivity of the central boundary of a
   simply connected semisimple group, citing Kneser 1971, Chapter V,
   Theorem 1.7, p.77. That proof was not read; neither H¹=1 locally nor the
   global H¹ Hasse principle by itself supplies this assertion. The cleared
   Platonov–Rapinchuk chapters stop at Chapter 5, before the relevant later
   treatment, so do not use another uncleared copy.
3. **§3.8c extended type.** Harari–Skorobogatov, *Descent theory for open
   varieties*, Proposition 1.1, author pp.3–6, provides the complex including
   nonconstant units. The beginning of its proof and later Theorem 3.5 /
   Corollary 3.6 were read; the complete derived/compact-support proof on
   pp.4–6 still needs reading and explicit ownership. The constant-units
   proof in §3.9a cannot replace it. The Rosenlicht/Picard product and
   compatible-cover trivialization steps in §3.8e also need their complete
   supplier proofs, rather than just a citation to a product formula.
4. **§4.9c regular curves in characteristic p.** Voloch Theorem 2 treats the
   finite-constant-field case using genus change and Frobenius. Finish the
   tower stabilization and arbitrary-constants bridge, or precisely reduce
   the requested scope with the maintainer. Do not present the smooth case
   or a finite-constants theorem as proof of the full statement.
5. Audit the other newly written deep routes in the order of the table.
   In particular, addition of a target named after a theorem is not enough
   unless its proof prerequisites terminate in the actual supplier layers.

## Sources read and useful public restart locators

The following records proof passages used for the additions; the README has
the per-target links and locators. These are reading records, not blanket
claims of closure. Books in the cleared library were read there; no files or
passages from them enter this repository. No restricted Bombieri–Gubler copy
was used. Its earlier bibliographic-only citation remains bibliographic only.

- [Conrad, trace and Lang–Néron](https://math.stanford.edu/~conrad/papers/Kktrace.pdf):
  Theorems 6.2,6.4,6.8,6.12 and §7, pp.20–26; curve H¹/boundedness proof route.
- [Lieblich](https://arxiv.org/abs/math/0511244), §3.1.1,
  Propositions 3.1.1.1–3.1.1.12, author pp.7–13;
  [de Jong's Gabber proof](https://www.math.columbia.edu/~dejong/papers/2-gabber.pdf),
  complete nine-page note; Bass's projective stabilization/cancellation
  passages, pp.8–10,15–16 of the linked copy.
- Colliot-Thélène–Skorobogatov, *The Brauer–Grothendieck group*,
  §§3.7–3.8, pp.93–101 and §5.3, pp.136–137, read in the cleared copy.
  Scope of regularity and properness is kept in the README.
- Colliot-Thélène–Skorobogatov, *Good reduction of the Brauer–Manin
  obstruction*, Lemmas 1.1–1.3, pp.579–581; Debarre's rational-connectedness
  notes §2.2, pp.5–6. Used for §2.20, not an automatic algorithm.
- [Halpern-Leistner](https://arxiv.org/abs/1008.0891v1), §2, pp.4–7,
  §3, Propositions 3.5 and3.7, pp.10–11. The attempted Bott download was an
  HTML page, not a read proof; no claim of reading Bott is made.
- [Skorobogatov 2009](https://www.ma.imperial.ac.uk/~anskor/mathann09.pdf),
  Lemma 2.2 and Propositions 2.3–2.4/Corollaries 2.5–2.7, pp.503–507.
- [Cao 2018](https://arxiv.org/abs/1604.03386v4), *Approximation forte pour
  les variétés avec une action d'un groupe linéaire*, §3.6–3.10, pp.15–17,
  §5.1–5.12, pp.23–28; [Cao 2020](https://msp.org/ant/2020/14-8/ant-v14-n8-p05-s.pdf)
  and [its corrigendum](https://arxiv.org/abs/2201.10717v1), author pp.3–5.
- [Borovoi 1991](https://archive.mpim-bonn.mpg.de/395/1/preprint_1991_83.pdf),
  §§1.3–2.6, pp.4–6, Proposition 4.1, pp.8–9, Theorem 5.6/Lemma 5.7,
  pp.10–11, and §§6.1–6.9, pp.11–13. Its Kneser input remains open above.
- Harari–Skorobogatov 2002, §3.3, (10)–(11), Proposition 3.7,
  pp.253–254 and Appendix B, pp.270–271; Harari–Szamuely 2008,
  Proposition 3.3, pp.537–541, with the totally imaginary hypothesis tracked;
  [Milne, ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), I.4.20,
  pp.65–66 and I.6.11. General real places use complete Tate terms.
- Samuel, *Compléments à un article de Hans Grauert sur la conjecture de
  Mordell*, Theorems 1–3, pp.56–59, Theorems 4–5, pp.59–61, Theorem 6,
  pp.61–62, including the normalization argument; Grauert's jet proof;
  Voloch 1991, Theorems 1–2 and proofs, pp.122–124.
- Rémond 2000, §4 and Appendix, pp.529–537, for maximal-coset degrees;
  Faltings 1991, pp.549–571; Rémond's Vojta-inequality article,
  pp.101–151; Bombieri 1990, pp.615–640, and 1991 erratum, p.473.
  All these proof ranges were read, but the resulting decomposition still
  needs the closure audit described above.
- Pink–Rössler's [2004 paper](https://people.maths.ox.ac.uk/rossler/mypage/pdf-files/pr2.pdf),
  complete 22-page proof, is distinct from their 2002 arXiv paper used for
  the characteristic-zero route. Fontaine 1977: I §10, pp.62–70;
  II §§1–2.3, pp.71–82; III §§1–4, pp.125–151, §6.1–2, pp.161–164.
  Manin 1963, II §§1–2, pp.25–33. Scope is connected finite-height formal
  groups and slopes, not all finite-flat or p-adic Hodge theory.
- Gillet–Soulé, arithmetic intersections, §§1.2–1.3, pp.100–109,
  §§2.1–2.2, pp.111–120, Theorem 4.2.3(iii) and proof,
  pp.139–140,144–145; Zhang, *Positive line bundles on arithmetic varieties*,
  the Hilbert–Samuel/minima proof passages and variational argument;
  Demailly, *Champs magnétiques et inégalités de Morse*, pp.200–203;
  SUZ, pp.347–348; Zhang's seven-page Bogomolov proof, read throughout.
  The singular-model squeeze and positivity of both auxiliary bundles are
  explicit in §5.17d. No resolution of an arbitrary arithmetic model is used.

## Current owners and tier moves

Read the current roadmaps at commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` read-only. Searched the nine
post-snapshot roadmaps and Completed roadmaps as well as the relevant existing
interfaces. No Lake command ran there. Checked native declarations at the
formalization pins before using their signatures.

- Adic completion, compact completion integers, finite adeles and adelic
  local compactness already exist. Retain the previous imports of general
  algebra-map topology from ReductiveGroupsPartII RG2.0.1/RG2.0.3 and abelian
  subvarieties/Poincaré complements from AbelianSchemesAndArithmeticModuli
  A6.3–A6.5. There are no new removals of original numbered targets.
- Heights is tier 9. AdelicAlgebraicGroups is **tier 2**, so its AA.3
  reduction theory and AA.4.1 number-field simply connected H¹ are legitimate
  lower suppliers. AA.4.1 does not supply Harder's global-function-field case.
- Move the number-field arbitrary-dimensional adelic-intersection,
  Hilbert–Samuel, minima and variation scope down from
  ArakelovGeometryAndAbelianHeights Part II (tier 27) to §§5.17a–g here.
  Its owner should import this scoped result, not vice versa.
- Move the scoped characteristic-zero positive-divisor/complete-intersection
  comparison down from Lefschetz (tier 10) to §§2.25a–b here.
- Move only the connected finite-height formal Dieudonné/slope inputs needed
  by §§5.7a–d down from FormalGroupsAndFiniteFlatGroups (tier 10) and the
  different Crystalline bundle. Do not import those higher packages or move
  their entire subject into this roadmap.
- Use actual `TauCetiRoadmap.StableReduction` Layers 2–3, not the nonexistent
  `StableReductionAndModuliOfCurves` name. SchemeAndStackFoundations T398/T399
  supplies stable-curve finite/unramified Isom in every characteristic;
  its T381 supplies Stein factorization and T380 formal functions. The
  characteristic-zero curve automorphism target alone is insufficient in
  Samuel's argument.
- The lower ComplexComparisonPartII, AlgebraicModuliForArithmeticGeometry,
  IntegralGeometry and ArithmeticGaloisDuality contracts are the named
  suppliers in the new subsections. Their exact hypotheses still need the
  closure audit; the packet has not been altered to claim these moves done.

## Validation

- `lean-check research/blueprint/packages/HeightsRationalPointsAndObstructions/Suggested.lean`:
  exit 0, **29 warnings, all `declaration uses sorry`**, no errors. Shared
  pinned build: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. Lean file remains 230 lines.
  No Lean server, build, update or cache download was started.
- `python3 scripts/check_sorry_data.py` on the Lean file: exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/HeightsRationalPointsAndObstructions.json`:
  **0 errors, 0 warnings**. The unchanged packet still has 147 nodes and
  17 gaps; the check is schema/coverage validation, not proof closure.
- Original-heading comparison: all 139 retained, 76 additional, no repeated
  numbered IDs. Each added subsection has explicit Checks. Relative Markdown
  file links exist. External-source section numbers are not local anchors.
- Audited 44 newly introduced source URLs. One 404 was corrected to the
  author-hosted published Skorobogatov PDF. Numdam rejects HEAD requests
  with 405; the corresponding PDFs were successfully obtained with GET.
- Final `git diff --check`: passed. `intake.py check-files` on the two changed
  deliverables: **2 files, 0 problems**. No private paths or restricted source passages are
  included. Scratch downloads/notes are disposable; everything needed to
  restart is in this note, the README and the unchanged review report.

## Submission handling

Submit this as a **draft checkpoint PR**, with `Refs #9836`. The current
`issues.deliverables_complete` has no package-status branch: once all four
output paths exist, it treats the job as complete, even if the handoff says
partial. A ready PR could therefore be merged as a completed package by
mistake. WORKERS explicitly leaves draft PRs to the maintainer. The draft is
intentional so the maintainer can preserve checkpoint status and arrange
continuation; it is not a request for an acceptance review of unfinished work.
Do not edit intake or labels as part of this package-only job. No second job
was claimed.
