# RT-RS-03 — classical, computational and Diophantine restructuring

Codex, session `codex-rtOQ9t`, 30 September 2026. Complete independent
restructuring attack at explorer `046729cdda0f7089f43ba13fea6d9be4542db0c9`.
I did neither RS-03 (ChatGPT, `gpt6-20260921-r7c42a`) nor REV-RS-03
(Claude Code, `cc-442dc5`).

**No new finding. This is not a clean bill of health for every member roadmap.**
In particular, the missing concrete modular-form suppliers of CN.3 remain
visible, but are already the confirmed `RT-AREA-computational/3`, with a
maintainer edit in its fixes report. Reissuing that defect under another ID
would duplicate an existing repair. The target here is preservation and
ownership under RS-03, not a new proof audit of every theorem in eight areas.

## Inputs and version boundary

Read the full eight member READMEs (52 stages), the family file (76 directed
overlap leads, 42 unordered pairs), current research result, report and
REV-RS-03. Read the reviewed library-coverage records for the changed stages
and relevant unchanged suppliers, and the actual external stage contracts
used by the links. The elliptic anchor checks cover its relevant isogeny,
finite-field, twist, height, Mordell–Weil, Selmer and database interfaces;
this is not a fresh review of that entire roadmap. Also checked the relevant
GN.5 and modular-symbol decisions in RS-07/08 and existing computational and
combinatorics red-team records.

Distinguish three versions:

* The original report and review describe 22 layer entries: 21 narrowings and
  CA.4 kept. The review added 42 forwarding links to the original 21.
* Current `research/blueprint/restructure/RS-03.result.json` has **23 entries:
  22 narrowings and one keep**, **64 links**, **25 ownership records**, and
  keeps all eight roadmaps. The other 29 stages remain unchanged.
* The promoted `data/restructure/RS-03.result.json` has the earlier AC.0 audit
  number, no AC.2 narrowing, and no AC.0 → ER.4 edge or ER.4 former-owner entry.
  Commit `a219414` (PR #4635) added those research changes for
  `RT-AREA-combinatorics/3, /14, /16`. Its fixes report explicitly says the
  promoted mirror is regenerated on promotion and gives the corresponding
  report/README changes to the maintainer. The old report's counts and AC.2
  row are therefore historical, not evidence that the new JSON deletes Roth.

All IDs and comparisons below refer to the pinned explorer snapshot, not to
whatever another worker subsequently promotes.

## Preservation ledger

“Unchanged” means the full existing construction and acceptance requirements
survive, including source gaps; it does not certify their proofs or completion.

| Stages | Attack and disposition |
|---|---|
| CA.0 | Arithmetic, CRT, valuation, arithmetic-function and convolution imports remain; no restructuring into new foundational proofs. |
| CA.1 | Higher reciprocity, residue-symbol comparisons and exceptional places survive. FF.1 supplies the finite-field character part, not general Hilbert reciprocity. Place 2, infinite places and ramification cannot be erased by that import. |
| CA.2 | Recurrences, companion matrices, divisibility sequences, Bernoulli/Euler, generating functions, radix/automatic sequences, Farey and Christol targets unchanged. |
| CA.3 | General matrix normal forms retain reconstruction, divisibility and termination; integer-valued polynomials and missing irreducibility refinements remain. Built special cases and resultant/discriminant infrastructure are imports. |
| CA.4 | Entire elementary lane kept: Pell, squares, elementary descent, scoped exponential equations, linear systems, numerical semigroups and Egyptian fractions. No advanced DT/ED method is made a blanket prerequisite for an elementary proof. |
| CA.5 | Quadratic/cyclotomic and intrinsic-invariant comparisons remain. CN.2 supplies certified computation with completeness, while library existence theorems supply intrinsic bases, units and class groups. |
| CA.6 | Pisot/Salem, selected lower bounds and dynamical comparisons survive; Mahler measure, house and height conventions must be compared. Lehmer is not promoted to a theorem. |
| CA.7 | Integral Galois modules, normal-integral-basis/tame hypotheses, resolvents, orders and class/K-theory targets unchanged. A rational normal basis does not supply an integral one. |
| CN.0 | Exact carrier/refinement and checking/cost contracts remain. CA.3 supplies normal-form mathematics and FF.0 specialized finite-field constructors; neither makes all algebraic-number or p-adic computation automatic. |
| CN.1 | Primality, integer/rational factorization and certificate orchestration survive. FF.3 supplies finite-field factorization. Probabilistic output is not relabelled proved primality or deterministic complexity. |
| CN.2 | Certified integral bases, orders, prime decomposition, units/classes, local expansions and stopping/completeness proofs unchanged. Non-effective existence does not close this stage. |
| CN.3 | Exact modular-symbol/Hecke/q-expansion and curve adapters remain. FF.3 and ED.3 supply counting and certified descent; elliptic anchor 1/3/6/7 supplies its existing mathematical contracts. The modular-symbol import defect is the pre-existing finding discussed below. |
| CN.4 | Validated analytic arithmetic and precision propagation unchanged; it supplies ED.2, not ED.0's foundational exact-input stage. Existing area findings about exact vanishing and analytic rank are not resolved by this restructuring. |
| CN.5 | Generic certificate schemas, reproducibility and checking-cost contracts unchanged. A schema does not itself prove an example's completeness. |
| FF.0 | Explicit finite-field presentations/inverses and constructor comparisons remain, importing abstract finite-field/Frobenius/normal-basis results. Tensor and other original comparison targets are not replaced by cardinality alone. |
| FF.1 | Field trace, additive/multiplicative character and Gauss/Jacobi specialization contracts survive. AC.0 provides generic normalized Fourier comparison, with the cardinality factor retained. Trivial characters and characteristic hypotheses remain separate. |
| FF.2 | Weil/Deligne estimates unchanged, with conductor/nontriviality hypotheses and geometric top-cohomology main terms retained. This does not assert square-root cancellation for a trivial phase. |
| FF.3 | Certified finite-field factorization, Hensel and point-counting algorithms retain correctness, trace convention, costs and randomness models. Elliptic Hasse theory supplies the bound, not a certified fast counting algorithm. |
| FF.4 | Galois rings, additive/permutation polynomials, recurrence/correlation, coding and finite homogeneous-space interfaces unchanged. Finite-field construction is not a substitute for them. |
| FF.5 | Mathematical export/application comparisons remain; FF.2 supplies estimates and CN.5 generic schemas. Cryptographic hardness stays a hypothesis. |
| AC.0 | Energy and Plünnecke–Ruzsa imports remain; missing character-indexed finite-abelian normalization and convolution comparison remain here. Existing character bases and orthogonality are inputs, not absent objects. |
| AC.1 | BSG, Freiman/Bohr and density-increment/regularity targets unchanged. |
| AC.2 | Later narrowing imports built Roth, Behrend and van der Waerden, preserving stronger quantitative work, k ≥ 4 Szemerédi, correspondence/Varnavides and arithmetic removal. The exponent-two ThreeAPFree convention is handled explicitly. |
| AC.3 | Gowers norms, inverse theorems and nilsequence proof targets unchanged by RS-03. Existing area ownership fixes are not silently considered applied. |
| AC.4 | Majorants, dense model, relative counting/Szemerédi and prime-distribution inputs unchanged. |
| AC.5 | Finite-complexity prime-pattern counts, local factors and Möbius–nilsequence work unchanged; not merged with ES.4's optimized prime-weighted circle-method branch. |
| ES.0 | Differencing, completion, derivative/stationary-phase estimates unchanged; finite-field estimate suppliers do not own those analytic estimates. |
| ES.1 | Torus orthogonality/counting, arcs and weighted/smoothed variants unchanged. The torus integral is not merely the finite-group Fourier transform owned by AC.0. |
| ES.2 | VMVT and the selected decoupling/congruencing route, including low-degree inputs, unchanged. |
| ES.3 | Singular series/integrals, local densities, positivity and major-arc comparison unchanged; convergence and nonsingularity remain obligations. |
| ES.4 | Waring, prime-weighted and many-variable applications retain proved ranges and errors. Elementary sums of squares and AC.5 do not replace these routes. |
| ES.5 | Determinant method and bounded-height counting unchanged; upper bounds are not converted into positive-main-term asymptotics. |
| DT.0 | Approximation exponents and quantitative comparison work remain. Built absolute-height/product-formula and available continued-fraction/Dirichlet inputs are consumed with their actual conventions. |
| DT.1 | Liouville/Thue/Roth approximation route unchanged. Roth here concerns algebraic irrational approximation, not AC.2's three-term progressions. Ineffectivity is preserved. |
| DT.2 | Subspace theorem, exceptional subspaces, nondegenerate S-unit and form-equation finiteness unchanged. These are not an effective search bound. |
| DT.3 | Explicit logarithmic-form estimates retain branch, nonvanishing, height/degree and archimedean/p-adic hypotheses. |
| DT.4 | Equation-specific bounds and solution-preserving reductions remain; DT.3 estimates alone do not supply these conversions. |
| DT.5 | Mahler/E/G-function, functional transcendence and algebraic-independence targets unchanged; they are not RP.5's arithmetic distribution theorems. |
| ED.0 | Exact algebraic-number isolating interval/disc and local-precision adapters remain on CN.0's carriers. No dependency on the later analytic-error stage is inserted. |
| ED.1 | Bounded short/closest-vector reduction and exclusion certificates remain; GN.5 supplies verified LLL. An approximation factor is not an unrestricted closest-vector solver. |
| ED.2 | Imported DT.3/4 bounds, CN.4 evaluation and ED.1 reduction are assembled into exhaustive certified enumeration. Bounds, numerical precision and “no omitted solutions” are separate obligations. |
| ED.3 | Local-image computation, saturation and rank certificates remain on RP.1 and elliptic 6/7 interfaces. A finite subgroup containing descent image gives an upper bound, not equality with rank or an algorithm computing it. |
| ED.4 | Classical Chabauty/Coleman route and all residue-disc/zero-count obligations unchanged; finite p-adic candidates do not alone prove rational completeness. |
| ED.5 | Mordell–Weil sieve, finite reductions, saturation/index assumptions and exhaustive intersection unchanged. |
| ED.6 | Worked examples and conditionality/completeness labels remain; CN.5 supplies schemas and NC.5 the quadratic/nonabelian Chabauty mathematics. |
| RP.0 | Divisor/line-bundle height machine, functoriality, general abelian-variety/local heights and comparison to absolute and elliptic heights remain. The elliptic factor-of-two comparison is explicitly retained. |
| RP.1 | General abelian-variety Kummer/isogeny geometry, fppf comparison and finite generation remain. Anchor 7 owns the general discrete-Galois-module Selmer framework; that import does not supply all the geometry. |
| RP.2 | Adelic points, Brauer evaluation, finite support and obstruction tests unchanged. |
| RP.3 | Geometric torsors and descent/Brauer–Manin comparisons remain. Pointed elliptic forms classified by H¹(Aut(E,O)) are not unpointed genus-one torsors. Anchor 7 supplies a cohomological Weil–Châtelet interface, not the geometric comparison. |
| RP.4 | Parshin/Faltings and Siegel finiteness unchanged; these do not silently become effective enumeration. |
| RP.5 | Mordell–Lang, Manin–Mumford and Bogomolov/small-point targets unchanged, with stabilizers, translates and genericity retained. |
| RP.6 | Separate local-solubility, obstruction, finite-generation, finiteness and certified-enumeration exports survive; conjectural statements remain conditional. |

## Pinned declaration checks

Actual statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, not inferred from names or HEAD.
These are targeted falsification checks, not a replacement audit of all 52
layers and not a fresh library-wide absence claim.

* Tau Ceti `LinearAlgebra/Matrix/SmithNormalForm.lean:743`:
  `exists_smith_normal_form_of_det_ne_zero` is for square integer matrices
  with nonzero determinant and returns GL row/column factors and a positive
  divisibility chain. `smith_normal_form_unique` at 836 allows singular
  diagonals. Neither statement supplies a terminating rectangular/general-PID
  algorithm. CA.3's distinction is substantive.
* Mathlib `Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean:125`:
  `AddChar.complexBasis` already gives the character basis for a finite
  abelian group. Tau Ceti
  `GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104` gives column
  orthogonality, with the identity case returning `Nat.card G`. AC.0/FF.1
  must consume these. The remaining transform normalization/convolution
  comparison is not a claim those bases or character sums are absent.
* Mathlib `NumberTheory/GaussSum.lean:188,222`:
  `gaussSum_mul_gaussSum_eq_card` needs nontrivial multiplicative character
  and primitive additive character; the square formula also needs a
  quadratic character. RS-03's normalized Fourier transform has a factor
  `1/|G|`, whereas these Gauss sums are unnormalized. ER.4's C-torsion group
  has size C² and its unitary convention uses `1/C`, a third convention
  explicitly distinguished in the later link reason.
* Mathlib `Combinatorics/Additive/Corner/Roth.lean:137,163,196`:
  finite-group and natural-interval Roth, and the `o(N)` theorem; read
  `AP/Three/Defs.lean:72`'s additive-generated convention. In exponent two,
  two distinct elements a,b give `a+a=b+b`; the repeated-endpoint triple
  (a,b,a) violates ThreeAPFree. No odd-order assumption is smuggled into the
  built theorem. Also read `Behrend.roth_lower_bound` at
  `AP/Three/Behrend.lean:481` and `exists_mono_homothetic_copy` at
  `Combinatorics/HalesJewett.lean:459`. These justify the later AC.2 import;
  they do not close k ≥ 4 density or arithmetic removal.
* Tau Ceti `AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean:116–125,166`:
  the actual height is `lim h(2^n P)/(2*4^n)`, with convergence proved for an
  elliptic curve. The anchor README's Layer 6 chooses twice that
  normalization. RS-03 expressly keeps the comparison rather than equating
  them; regulator consumers must transport the pairing too.
* Tau Ceti `AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean`:
  `selmerGroup₂`, `card_range_μ` and
  `pow_rank_le_card_of_range_μ_le` were read with their characteristic-not-two,
  Dedekind/local-field and finite-generation/finite-S hypotheses. Its
  opening explicitly disclaims finiteness and effective computation of
  Selmer. The anchor's *planned* general Selmer framework is therefore
  distinguished from this built explicit two-descent input. ED.3 retains
  local computation and saturation rather than declaring them built.
* Tau Ceti `NumberTheory/ModularForms/SturmBound.lean:79,102`:
  `sturm_bound_finiteIndex` and `eq_of_sturm_bound` require finite relative
  index and discrete strict periods, with the specific q-expansion width and
  coefficient cutoff. They are characteristic-zero equality statements,
  not a mod-prime congruence certificate or a modular-symbol construction.

## Suppliers, forwarding and graph checks

Read all 25 owner records against the member/supplier descriptions. In
particular, GN.5 supplies LLL; DT.3 → DT.4 → ED.2 keeps estimate, conversion
and enumeration separate; ED.3 → CN.3 has no reversed foundational import;
and the abstract Selmer owner is elliptic anchor 7. Read the external
consumers DY.1/3/4/5, ST.4, NC.5 and ER.4 and GN.5's actual contract.
NC.5 retains its rank/Picard/local-height hypotheses, DY.1 ampleness and d>1,
DY.4 genericity and measure comparison, and ST.4 the rank inequality rather
than Selmer-rank equality. No scope weakening is introduced by forwarding.

The proposal checker passes. Independently applied the current research
proposal in memory with `apply_restructurings`, after
`build.assemble(require_distances=False)`:

| Graph | Unique directed stage edges | Result |
|---|---:|---|
| Raw atlas plus all 64 RS-03 pairs | 3,572 | No target-to-source path for any proposed pair. |
| Production assembly before research amendment | 8,007 | 2,840 stages; 63 of the 64 pairs already present. |
| Production plus research RS-03 | 8,008 | All 64 present; no skipped links; no old edge lost. Only new edge AC.0 → ER.4. |
| Conservative union with research link maps, accepted research restructurings and declared prerequisites | 8,827 | No target-to-source path for any RS-03 pair. |

The raw atlas has 1,968 stages and 3,508 edges. These cycle tests establish
that no tested cycle contains an RS-03 edge; they do not certify every
unrelated proposed edge in the enlarged union. All concrete `suppliedBy`
stages reach their narrowed layers. Checking the original atlas consumers
finds only the already-explained direct-forwarding exception AC.0 → AN.1:
RS-07 drops AN.1, and REV-RS-03 explicitly excluded that edge. No new
forwarding omission was established. All 52 member IDs remain, with no
retirement, move or extension; no Tau Ceti mathematical contract is edited.

The modular-form exception is real but already tracked. Reading CN.3 and
ModularForms Layer 8 shows the need for the homological symbol module,
Manin presentation, integral Hecke action and the period map to the **dual**
of symbols (Hecke acts by precomposition). R12.5's differential comparison
and R14.1's algebraic correspondences do not supply that whole interface.
The assembled graph has no Layer-8 → CN.3 path; the generic UPSTREAM text
does not draw one. This is precisely confirmed
`RT-AREA-computational/3`; its fixes report §/3 supplies the maintainer
edit. The verifier also correctly limits Layer 11 to computations that
actually use its trace formula. This report preserves that repair and does
not manufacture a new unconditional Layer-11 dependency.

## Validation and limits

Ran `check_restructure.py` on the accepted target, `check_redteam.py` on
this result, the intake file check on these two deliverables, and
`git diff --check`. Graph experiments used memory only and changed no atlas,
proposal, roadmap or library file. No Lean file is required or supplied for
this red-team job; no Lean compilation, Lake project, cache download or
language server was started.

The finding list is empty because no **additional** evidenced defect survived
the ownership, target and graph checks. Existing area findings, deferred
maintainer edits and unread proof obligations remain in their original
records. Nothing in this report claims the planned mathematics is formalized.
