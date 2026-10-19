# Independent review: excursion operators and the spectral action, revision 5

Verdict: **accepted at target level** after an in-place correction to the
finite-wild subgroup hypotheses. This completes issue #11020,
`REV-ExcursionOperatorsAndSpectralAction--ES0~5`. Reviewer: Codex, session
`codex-fPeUUt`, 2026-10-19. This session authored none of the five blueprint
revisions under review.

I checked all 42 local targets, their hypotheses, proof outlines, sources,
prerequisites and acceptance conditions: **39 verified, three corrected**.
The ninth scoped stage, ES5, imports exactly eight existing owner nodes and
their three remaining refinements. It introduces no local target. All nine
stages remain **planned**, all implementation statuses **unchecked**. The
three local mathematical refinements and eleven open supplier contracts remain.
Acceptance approves the target-level plan with these explicit boundaries;
it supplies no proofs or completed supplier implementations.

## Correction and revision-5 scope

The group quotient `W_E/P` requires P normal in the full Weil group. The
inherited hypotheses sometimes specified only an open normal subgroup of
wild inertia. I made the convention precise in the packet and reader: P is
contained in wild inertia, open in wild inertia, normal in W_E and contained
in the pinned-action kernel. This corrects the excursion-algebra action,
uniform-cutoff theorem and finite-wild Hecke-category definition.

The cutoff proof now takes the kernel of the finite wild-inertia image of
the tensor-generator Weil action. Conjugation by W_E preserves this kernel
because it comes from the full Weil action. Intersecting with the pinned
kernel preserves both required properties. This gives the normal subgroup
needed for the quotient without assuming that an unspecified infinite normal
core remains open. The pro-p/pro-ell finiteness argument and enhanced
quotient-equivariant full faithfulness remain explicit inputs (IX.5.1,
pp. 327–328). No new carrier or local target is introduced.

The added ES5 scope is correctly imported from
[its owner packet](../packets/ExcursionOperatorsAndSpectralAction--ES5.json),
accepted by `independent-review-REV-ExcursionOperatorsAndSpectralAction--ES5~2`
on 2026-10-09. I read all eight owner statements and hypotheses and checked
the reader's eight-row map and exact coverage refinements:

| Owner target | Interface checked |
| --- | --- |
| `schur-irreducible-object` | The canonical scalar map is an isomorphism of condensed degree-zero algebras. |
| `condensed-schur-from-admissibility` | Admissibility and enriched fixed vectors supply Schur; no compactness of the irreducible object is assumed. |
| `excursion-character-of-a-schur-object` | The central action yields scalar excursions with integral relations and continuity. |
| `abstract-semisimple-parameter` | The arbitrary-discrete-group classifier remains a precise LP2 refinement. |
| `parameter-of-a-schur-irreducible-sheaf` | The result is a continuous semisimple lift of W_E to H semidirect Q, unique up to H-conjugacy. |
| `parameter-of-an-irreducible-smooth-representation` | The fully faithful left stratum adjoint and its unit supply the enriched comparison. |
| `stratum-centre-embedding-independence` | The adjoint retractions and comparison restricting to the identity are required; full faithfulness alone does not suffice. |
| `invariance-and-coefficient-transport` | Operator base change and Schur after transport are explicit hypotheses. |

The local excursion action precedes this parameter construction. It does
not depend back on ES5, so the scope import creates no construction cycle.
The parameter assignment does not inherit the center-order or integral
actual-Perf good-prime restriction (VIII.3.8, VIII.4.3 and IX.4.1,
pp. 290, 292–293, 327). ES5's admissibility/enriched-stratum, continuity and
arbitrary-discrete-group classifier refinements remain exactly as in its
owner. This is an interface audit, not a replacement review of that part.

## Target findings

Every row refers to the packet's full node id; the prefix before the slash
is its stage. Page numbers below belong to the hash-identified author copy.

| Target | Verdict | Independent finding |
| --- | --- | --- |
| `ES0/bernstein-center-of-a-category` | verified | IX.0.2, pp. 318–319 and IX.5, p. 328: endomorphisms of the enhanced identity have the required E_2/degree-zero structures. The ordinary CatCenter comparison does not supply this enhancement; E5 is the explicit owner. Perf(A), zero and scalar tests have different failure modes. |
| `ES0/enhanced-to-homotopy-center` | verified | IX.5, p. 328: evaluating enhanced classes gives a natural ordinary central transformation. The target asserts the comparison map and scalar compatibility without inferring its surjectivity or injectivity. |
| `ES0/excursion-datum-and-operator` | verified | VIII.4.2, pp. 291–292; IX.2, pp. 321–324: creation, the Weil tuple and annihilation use the normalized coherent Hecke family. Identity tuples give beta alpha; the two-leg trace has the inverse in the second factor. LP2 retains abstract realization independence. |
| `ES0/excursion-algebra-to-bernstein-center` | corrected | VIII.4.1, pp. 291–293; IX.5, p. 328: the enhanced composites give degree-zero relations before any Perf action. Corrected P to be normal in W_E and open in wild inertia, so its quotient and discretization are defined. E1 requires commutativity only. |
| `ES0/continuity-of-excursion-evaluations` | verified | IX.1.2, pp. 320–321 and VIII.3.7, pp. 288–290: relatively discrete compact-source Hom gives the continuous evaluations. The flat-target torsion-free factorization is qualified and does not assert that integral torsion vanishes. |
| `ES0/discretisation-of-the-weil-group` | verified | VIII.3.7, pp. 288–290: the dense discrete tame model and its torsion-free comparison are separate from the stronger invariant-ring isomorphism. LP0/SR.6.1 own the discretization and change-of-generator contracts. |
| `ES0:classical-center/map-to-the-classical-bernstein-center` | verified | VII.7.2, pp. 272–273; IX.5, p. 329: the fully faithful stratum functor and ordinary heart comparison support the b=1 center restriction. SR.0d already owns the derived smooth model; the enhanced upgrade remains the narrower E5/VS supplier request. |
| `ES0:classical-center/complex-block-comparison` | verified | IX.5, p. 329 and upstream SR.3.2: an explicitly chosen abstract characteristic-zero field isomorphism transports ordinary centers and block descriptions. It supplies neither continuous field transport nor independence of ell. |
| `ES1/spectral-and-geometric-centers` | verified | IX.0.2, pp. 318–319; IX.5.2, p. 329: functions, enhanced central transformations and Hecke-compatible transformations are distinguished. The product switch test detects failure to commute with the Hecke functors. |
| `ES1:finite-ramification/uniform-wild-subgroup` | corrected | IX.5.1, pp. 327–328: one cutoff is chosen per compact object, uniformly over all I,V. Corrected the output to be W_E-normal, and replaced the unspecified normal-core step by the kernel of the finite wild image of the full Weil action, followed by the pinned-kernel intersection. |
| `ES1:finite-ramification/component-decomposition` | verified | IX.5, pp. 328–329: universal-homeomorphism transport suffices for clopen idempotents; compact finite support gives the direct sum and its Ind product. This uses no integral coordinate-ring isomorphism. |
| `ES1:finite-ramification/center-on-finite-wild-pieces` | verified | VIII.3.7 and IX.5, pp. 288–290, 328–329: refinement is checked on the same excursion coefficients. Enhanced quotient descent and the qualified coordinate comparison remain hypotheses; the diagram includes identity and composition transitions. |
| `ES1:spectral-center/spectral-to-geometric-center-map` | verified | IX.5.2, p. 329: the invariant-coordinate map retains invertibility of the order of pi_0 Z(G). Its root-datum translation and the distinct actual-Perf good-prime condition are not interchanged. |
| `ES1:spectral-center/center-change-of-data` | verified | VIII.4.2, pp. 291–293; IX.5.2, p. 329: change-of-data squares require the actual kernel, cocycle and invariant-coordinate comparison maps. Arbitrary invariants commuting with coefficient change are not an input. |
| `ES1:spectral-center/excursion-algebra-without-the-coefficient-condition` | verified | IX.6 opening, p. 330: the excursion action is retained when the invariant-coordinate comparison cannot be used. The universal homeomorphism still handles component idempotents, and ES5 owns the later parameter assignment. |
| `ES2/compactly-supported-actions` | verified | Chapter X opening, p. 339: support is expressed by factorization of each individual orbit functor through a finite-wild piece. Zero, one-piece and unbounded-family tests distinguish this from a common cutoff on all Ind objects. |
| `ES2/universal-parameter-hecke-family` | verified | X.1.1, pp. 341–342: universal representation bundles have the specified finite-set pullbacks, unit and fusion coherences. Empty legs and the free-loop case test stacky evaluation, beyond a list of ordinary functors. |
| `ES2/universal-action-theorem` | verified | X.1.1, pp. 341–342: characteristic-zero universality is an equivalence of spaces of coherent data. The proof sketch includes both inverse comparisons with their higher compatibility. |
| `ES2/mapping-stack-commutes-with-sifted-colimits` | verified | X.1.2, pp. 342–343: stable sifted-colimit preservation and symmetric-monoidal all-colimit preservation are separately stated. Exact pro-reductive invariants and rational representation generation are explicit supplier inputs. |
| `ES2/pushout-of-affine-quotients` | verified | X.1.2 proof, p. 343: the fiber product is derived and Perf composition uses the relative tensor product. LP4 supplies the parameter-stack comparison, while the more general affine-quotient compact-module statement remains requested. |
| `ES2/spectral-action-rational` | verified | X.1.3, p. 343: coherent Hecke data and the compact-object cutoff construct the rational action for every ell different from p. Categorical LLC and integral generation are not asserted by this theorem. |
| `ES2/degree-zero-center-agreement` | verified | X.1.3, p. 343 and IX.5.2, p. 329: evaluating a representation-bundle matrix coefficient recovers the previously normalized excursion operation. The additional comparison keeps the invariant-center coefficient range. |
| `ES3/sifted-colimit-approximation` | verified | X.3 opening, pp. 348–349: the animated finite-set colimit has its own comparison map to actual Perf. Empty, point and rational tests distinguish the approximation; equivalence before good-prime generation is not assumed. |
| `ES3/integral-universal-action` | verified | X.3.1, pp. 348–349: the integral approximation classifies Rep(Q)-linear coherent Hecke families. Its proof uses integral animation and does not import the rational action classification as a premise. |
| `ES3/approximation-commutes-with-colimits` | verified | X.3.2, p. 349: the DVR highest-weight tensor identity is the exact missing LP3 refinement already recorded. A field good-filtration result is not counted as supplying it. |
| `ES3/free-group-case` | verified | X.3.3, pp. 349–350: twisted free-group quotients include rank zero. Full faithfulness and the representation-generated image are separated from essential surjectivity, which needs the next generation input. |
| `ES3/discrete-group-presentation` | verified | X.3.4, p. 350: the finite-free sifted resolution is used on coordinate algebras and compact module categories. The latter remains the explicitly requested sifted comparison rather than a filtered-colimit substitution. |
| `ES3/discrete-integral-spectral-action` | verified | X.0.2, p. 340 and VIII.5.1, p. 293: LP4 generation upgrades the integral approximation to actual Perf at the dual fundamental-group good primes. The Chapter X action classification remains ES-owned. |
| `ES3/integral-spectral-action` | verified | X.0.1, pp. 339–340 and IX.5.1, pp. 327–328: the discrete integral action descends across eligible wild cutoffs. DVR/good-prime assumptions and the condensed mapping comparison remain explicit. |
| `ES3/action-change-of-data` | verified | X.0.1, pp. 339–340; X.3.1, pp. 348–349: integral change of data is constructed through the approximation and universal bundles, with actual endpoint comparison functors. It does not rely on characteristic-zero universality. |
| `ES3/derived-reduction-and-rationalization` | verified | X.0.1, pp. 339–340: action transport is conditional on geometric Perf and D_lis scalar-extension equivalences. The precise derived-reduction range is retained as a gap, not asserted for all coefficient algebras. |
| `ES1:finite-ramification/finite-wild-Hecke-category` | corrected | IX.5.1, pp. 327–328: D^P is defined using the fully faithful enhanced quotient-equivariant image for every Hecke input. Corrected the defining eligibility hypothesis to W_E-normality; the regular-action test excludes pointwise-only descent. |
| `ES2/whittaker-sheaf` | verified | X.1, pp. 343–344; X.3.5, p. 350; VII.7.2, pp. 272–273: the geometric extension uses the imported closed-unipotent compact induction. The torus gives regular compactly supported functions; neither nonopen Frobenius left adjunction nor Whittaker compactness is assumed. |
| `ES4/finite-wild-central-support` | verified | The evaluated central map has a kernel ideal and its prime zero locus at the Mathlib pin. The dual-number computation has full reduced support with nonzero annihilator; its Perf(k) use avoids incorrectly treating k as perfect over k[epsilon]. |
| `ES4/support-exact-operations` | verified | For a triangle, naturality factors an endpoint-annihilating middle endomorphism through the other endpoint; the product of the two annihilators kills the middle. Prime zero loci give the union bound, and explicit shift compatibility gives the rotated bounds. |
| `ES4/support-coefficient-change` | verified | Flatness preserves the kernel of r mapped to r id_X; an S-linear End tensor equivalence preserving the identity identifies the new evaluation kernel. The flat zero-functor example and the nonflat Z-to-Z/2 example with Q separately test the two hypotheses. |
| `ES4/central-localization` | verified | PrimeSpectrum.zeroLocus_subset_zeroLocus_iff at the pin gives the radical/power criterion. The categorical f-telescope additionally uses the E5 Ind/Verdier input and compact Hom formula; zero, unit and idempotent cases test its kernel. |
| `ES4/duality-and-the-chevalley-involution` | verified | IX.5.3, pp. 329–330; VI.12.1, pp. 239–241; VII.7.6, pp. 274–275: compact lisse duality intertwines the action with Chevalley. The inner rho-hat(-1) correction is retained before passing to invariant functions. |
| `ES4/local-shtuka-excursion-compatibility` | verified | IX.3.2, pp. 326–327: the normalized multi-leg shtuka complexes carry the compatible excursions and group actions. HS3 retains pro-p level compactness, Satake coefficient change, the level/tower distinction and trace indices. |
| `ES4/elliptic-parameters-and-components` | verified | X.2.1, p. 346: ellipticity uses a semisimple parameter and the finite algebraic centralizer quotient by the fixed center. Torus, trivial GL_2 and irreducible GL_n tests distinguish the intended definition. |
| `ES4/elliptic-parameter-component` | verified | X.2, pp. 346–347: LP1 deformation and Tate duality support the central-twist tangent computation. Twisted H^2 vanishing and the whole-connected-component argument remain named refinements; the residual stabilizer is retained. |
| `ES4/basic-decomposition-of-an-elliptic-component` | verified | X.2, pp. 346–348: ES7 parabolic compatibility excludes nonbasic contributions; compact generation and characteristic-zero supercuspidal block structure yield the basic decomposition. Finite fixed center gives Perf(Qbar_ell) summands without a conjectural indexing by Irr(S_phi). |

## API, Checks and granularity

I checked all **38 API items** and **31 Checks** across the ten definition or
construction clusters. Their statements and names agree between packet and
reader. The failure cases test mathematical content:

| Cluster | API / Checks | What the tests distinguish |
| --- | --- | --- |
| Enhanced center | 4 / 3 | Zero category, Perf(A) and scalar normalization; evaluation at an object is not the whole center. |
| Excursion operator | 4 / 4 | Trivial representation, identity-tuple composite, inverse in the two-leg trace and nonsplit cocycles. |
| Spectral/Hecke center | 4 / 3 | Scalar and identity compatibility versus a central product switch that fails Hecke compatibility. |
| Compactly supported action | 3 / 3 | Zero and one-piece actions versus an unbounded family with no uniform cutoff. |
| Universal Hecke family | 4 / 3 | Point evaluation, empty-leg unit and the free-loop automorphism data. |
| Integral approximation | 4 / 3 | Empty input, point input and rational comparison; these do not assume integral essential surjectivity. |
| Finite-wild category | 4 / 3 | Zero, tensor-generator uniformity and a regular-action non-example; enhanced descent is required. |
| Whittaker sheaf | 4 / 3 | Stratum restriction, regular functions for a torus and the trivial-group case. |
| Central support | 4 / 3 | Zero, free and dual-number residue actions; reduced support can forget a nonzero annihilator. |
| Elliptic parameter | 3 / 3 | Torus, trivial GL_2 and irreducible GL_n; the centralizer is algebraic and semisimplicity is required. |

The two coefficient negative controls supplement the support theorem's
acceptance conditions. For the flat identity map on Z, a compatible zero
functor can enlarge the annihilator without an End comparison. For the
nonflat map Z to Z/2, the Q object becomes zero: the identity-preserving End
tensor comparison exists, but the annihilator is not the extended ideal.
Together they prevent dropping either hypothesis of support equality.

The exact-triangle proof uses a product of endpoint annihilators, followed
by the prime-zero-locus union formula. Rotating the triangle uses the
stated suspension compatibility. A principal support criterion gives a
power in the annihilator; the categorical telescope additionally needs
Ind localization and the compact Hom formula. The reader keeps these
distinct. These checks support the generic native statements without
claiming their admitted Lean proofs have been supplied.

The 42 nodes have target-level granularity: seven definitions, three
constructions, twenty-nine theorems and three comparisons. Small arguments
stay in proof outlines. The **26 planets** name mathematical objects or
theorems; no stage exceeds seven, and none is a bare source number. The
ES5 references do not duplicate owner planets, APIs or Checks.

## Closure, baseline and current ownership

All local prerequisite chains were traced. The exact external-node
contracts (36 distinct nodes) were read in E5, HS, LP, VS and ES7;
stage-level contracts are stated separately where the existing supplier
does not provide the stronger result. The local dependency graph is
acyclic, and no local action construction uses the later ES5 assignment.
There are sixteen request records: five supplied at the planning-interface
level and eleven open. Neither category is a claim of formal implementation.

The three local refinements remain:

1. The DVR highest-weight tensor identity used in X.3.2, p. 349, beyond
   field good-filtration results (LP3).
2. The precise geometric Perf/D_lis/End scalar-extension and derived
   reduction range (LP1, VS3, HS1 and E5). The support equality remains
   conditional on its actual flat End comparison.
3. Twisted-invariant vanishing for elliptic H^2 and the proof that the
   central-twist locus is the entire connected component (X.2, pp. 346–347),
   with the residual stabilizer retained.

Read all nine scoped AUDIT-20 entries in `data/library-coverage.json`.
Read all **34 baseline declaration statements** at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, covering the ordinary center and
scalar map, ideals and prime zero loci, triangles/shifts/biproducts, flat
tensor exactness and the module/dual-number/ZMod examples. Their hypotheses
support the native statements; they do not implement the enhanced geometry.
The TauCeti baseline remains
`f790474821cf4256814db967cb154e7af3d0c369`; the file imports no TauCeti module.

Current upstream was read only at
`0d144d044dacebca17b654695b6f1ad58f159b27`, current TauCeti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. SemisimpleAlgebras and
InductionRestriction were the density/shape models. Relevant SR.0.4,
SR.0d, SR.1.3, SR.2.1, SR.2.3, SR.3.2 and SR.6.1 contracts and the
ClassFieldTheory Layer 9 carrier/topology target were checked. In
particular, the existing smooth category, ordinary center/corner theory,
derived smooth model, induction and cocycle gauge conventions remain
upstream-owned. The actual current `TauCeti.wildInertiaSubgroup` and
`TauCeti.tameQuotientEquiv` statements were read; their hypotheses do not
supply the entire geometric Hecke descent contract.

All nine named post-snapshot roadmaps and four named Completed roadmaps
were screened in their Suggested files, including OperatorTheory's eight
subfiles. LocalGaloisGroups' wild-inertia targets are imported foundations;
the analytic spectral and Schur–Horn targets have different subjects.
No duplicate enhanced-center, excursion or categorical-action target was
found. No ownership move or upstream file change is proposed.

## Sources and version limits

Freshly fetched and independently read the
[Fargues–Scholze author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
356 pages, SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
Direct page ranges: pp. 34–38, 239–241, 272–275, 288–293, 318–330 and
339–350. The target findings above give theorem/section locators; additional
support arguments are the roadmap's own algebraic deductions. The flat
kernel argument also matches
[Stacks, Section 10.39, Definition 10.39.1 and Lemma 10.39.2](https://stacks.math.columbia.edu/tag/00H9).
No verbatim source passages or section-by-section source summaries are
added to the repository.

Rechecked E1 on author p. 292, the reindexing square in the proof of
VIII.4.1. With H=Q=1, W=C2 and coefficients F2, the fold map restricts
functions on W squared to the diagonal. The pullback has eight elements,
whereas the scalar source has two. A function with one nonzero off-diagonal
value and scalar zero witnesses failure of cartesianness. The following
fusion argument uses commutativity, which holds. This independently
confirms the existing issue **only in the author copy**.

Fresh checks of the
[arXiv version record](https://arxiv.org/abs/2102.13459),
[Scholze publication page](https://people.mpim-bonn.mpg.de/scholze/papers.html),
[Fargues publication page](https://webusers.imj-prg.fr/~laurent.fargues/Publications.html),
[SMF publication record](https://smf.emath.fr/publications/geometrisation-de-la-correspondance-de-langlands-locale)
and targeted primary-domain correction search found no relevant erratum.
The [ten-page published sample](https://smf.emath.fr/sites/default/files/2026-07/AST-466-web__sample.pdf)
has SHA-256
`9988fc40a49c10116c7244591fa4ef8d35e398d2c81bd77990a61aee0b59db66`.
Its contents place VIII.4 on printed p. 351; it does not contain the proof.
The full published passage and arXiv byte identity were not checked.
Earlier reviews and version receipts are preserved in packet history.

## Suggested file and validation

The binding October 12/19 shape in WORKERS, PACKAGE_REVIEW and
UPSTREAM_GUIDE assigns absent enhanced carriers to the full reader. The
**217-line** suggested file has three light definitions with real bodies,
thirteen unproved named theorem targets and three proved examples. The
examples do not depend on admitted roadmap theorems. The file uses
`import Mathlib`; no admitted data, synthetic enhanced carrier or
construction is added. Its mathematical statements were checked, and the
file needed no edit for this review.

- `lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES0.lean`:
  exit 0, exactly thirteen declaration-uses-sorry warnings and no other
  diagnostics. The shared build's Mathlib commit was independently checked;
  available memory exceeded 20 GB. No TauCeti import or build-pin claim.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES0.json`:
  zero errors and zero warnings.
- Intake `check-files` on the changed deliverables and own handoff: zero
  problems. `git diff --check`: clean.
- Consistency checks: all 42 nodes recorded in this review; unchanged API,
  Check, planet and native declaration inventories; exact eight-node ES5
  owner import and refinements; acyclic local dependencies; preserved
  historical review and source-issue receipts.

No suspicious instruction was found in untrusted source or submission text.
This completes one review job; the remaining supplier and implementation
work stays with its recorded owners.
