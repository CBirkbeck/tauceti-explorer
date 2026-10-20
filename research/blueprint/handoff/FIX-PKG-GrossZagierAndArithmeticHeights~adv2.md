# Gross–Zagier package dependency repair

Issue #11381; job `FIX-PKG-GrossZagierAndArithmeticHeights~adv2`.
Codex (GPT-6), session `codex-nE7jYN`, 20 October 2026.

Completed the package fix. The package now has 292 targets: all 287 previous
targets, with their numbers and anchors retained, and five preparatory targets
in Layer 0a. In particular GZ.0, GZ.3 and GZ.9 retain their existing interfaces.
There is no prerequisite citation to HeegnerPointEulerSystems anywhere in the
README. Euler-system relations and descent remain downstream.

## Evidence available for this fix

Read the issue, package and all three reports present in
`research/blueprint/reviews/`: `REV-PKG-GrossZagierAndArithmeticHeights.md`,
`REV-PKG-GrossZagierAndArithmeticHeights~2.md` and
`REV-PKG-GrossZagierAndArithmeticHeights~3.md`. The issue's named
`REV-PKG-GrossZagierAndArithmeticHeights~adv.md` is absent from the checkout
and from GitHub main at the start of this run. I requested its location but
received no additional report. This fix resolves the explicit confirmed
findings in #11381 and preserves the corrections recorded by the three
available reports; it does not claim to have read the missing report.

The issue's ComplexMultiplicationAndExplicitReciprocity PR number is stale:
TauCetiRoadmap #1272 is EulerSystemsAndKolyvaginSystems. The CM port is
[TauCetiRoadmap #1254](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1254),
head `8b8948009c74f2154f08871085797110ad3e09ba`. Read that port's README and
Suggested.lean and checked the actual target names rather than propagating
the issue's mistaken number.

## Finding dispositions

| Finding or exposed interface defect | Change |
| --- | --- |
| GZ cites the later Euler-system roadmap in the supplier table, early layers and Layers 6–9 | Removed every such supplier citation, including layer dependency summaries, consequences and the former interleaving claim. Each mathematical ask now has an earlier import or an owned comparison. |
| Ring-class fields and dihedral action already have earlier owners | Import GlobalNumberFields Layer 11 and ClassFieldTheory Layers 11–13; import CM §3.1's generalized dihedral action. New 0a.1 proves only restriction, kernel and conjugation compatibility on those same fields and Picard maps. It makes no assertion that the full tower is procyclic or a single ℤ_p-extension. |
| Cyclic CM pairs and optimal embeddings were obtained from an interface excluding the extra-unit fields | New 0a.2–0a.3 supply actual cyclic pairs and the level embedding dictionary for all imaginary quadratic K, including discriminants −3 and −4, every conductor prime to N, and every cyclic Heegner level. They import the earlier curve/ideal action and underlying ideal/form classification. They retain all automorphisms. |
| A generic canonical curve does not itself give the required quaternionic CM point, reciprocity or level triple | New 0a.4 specializes the actual torus subdatum, reflex norm and canonical-model action; it records the stabilizer field, level maps, split comparison and the separate definite class-set map. New 0a.5 compares actual PEL fibres and Brooks's false elliptic surface, including fine level, differential and principal-ideal transport. Neither replans a curve or PEL moduli space. |
| Rational Hodge classes, parametrizations and degrees were imported from the later roadmap | Repoint to the existing owned 3.2–3.3 Hodge/ξ realization, 3.5 Manin constant and 3.9 Petersson/composition comparisons. Their substantive statements are retained. |
| Torus, Galois and lattice characters were identified without computing the inversion | Distinguish χ_T from χ_G through 0a.4's translation reciprocity. Correct the conventions and 8.8–8.14: a Galois-weighted sum has inverse eigencharacter; an ideal-weighted sum first needs inverse-ideal reindexing. The analytic character and central cancellation are χ_T. Explicit order-three witnesses detect both inversions. |
| Point Kummer classes and global local conditions were supplied by the Euler-system roadmap | Repoint 9.20 to PadicHodgeRegulators L1's general local point Kummer/logarithm comparison. Good reduction at v gives a local H¹_f statement, not a global Selmer condition. Preserve the general residue degree q=p^f, semilinear Frobenius and weight −1. |
| Downstream rank/Sha or main-conjecture deductions appeared as prerequisites/consequences of the construction | Keep them as downstream uses of 8.18 and 9.14. No Euler-system class or main-conjecture result is used to construct the height or root/square adapter. |
| Lean shape and convention controls | Retain the nine light definitions and six milestone signatures. Add eight proved arithmetic examples for CM level matrices, inverse Artin action, noncyclic kernels, surface degree/differential scaling, Atkin–Lehner direction, character reindexing and averaging. Delete the closing catalogue of unavailable carriers. No admitted data definition or fake CM carrier was added. |

The first two reviews' substantive repairs were already present at the input
commit, including nonzero projection hypotheses, explicit lift-length branches,
the semistable adapter, integral JL-lattice distinctions and the good-place/
nearby-kernel targets. The third report had resolved its six statement-source
questions and corrected 6.77, 7.4, 7.47, 8.17 and the classical locators. Those
repairs are preserved. The extra-unit supplier correction in its 8.15 is now
implemented by 0a.2 rather than relying on an informal extension of HE.1.

## Exact ownership and downstream repointing

| Former ask from the later roadmap | Supplier now used |
| --- | --- |
| Ring-class tower quotient and dihedral conjugation | GlobalNumberFields 11; ClassFieldTheory 11–13; CM §3.1; new 0a.1 for the comparison square and relative kernel |
| CM cyclic-isogeny pair | CM §§1.1–1.2, 2.3; new 0a.2 for the cyclic Γ₀(N) moduli adapter |
| Optimal-embedding CM points | IntegralLattices B5 and CM §1.2 for the ideal/form dictionary; new 0a.3 for its Γ₀(N) level comparison |
| Canonical-model CM descent | ShimuraVarieties §§4.1–4.4, 8.5 and HilbertModularVarietiesAndShimuraCurves R18.1; new 0a.4 for the specified quaternionic point and field |
| CM abelian surface, level and differential | PELModuli M2.8–M2.9, M4.1, M6.2, M6.9 and Brooks §§2.1–2.5; new 0a.5 for the particular fibre/level/ideal-transport comparison |
| Hodge base-point denominators and rational maps | Existing GZ 3.2–3.3, with 3.5 and 3.9 for differentials and degree |
| Local Kummer class, finite local condition and logarithm | PadicHodgeRegulators L1, applied locally in 9.20; global cohomology boundary only for localization compatibility |

The separate Heegner-point Euler-system fix should import these early
comparisons, retaining 0.5 for the Artin convention, Layer 3 for realizations,
and Layers 8–9 for height/logarithm identities. It should retain ownership of
Euler-system norm relations, derived classes and descent. No Euler-system
packet, reader, or other package was edited by this job. The blueprint packets
also remain unchanged because they are not among #11381's deliverables; their
propagation is a maintainer/intake task, not an unresolved package dependency.

## Adversarial pass: changed mathematical statements

Rows cover the new statements and their APIs as well as each changed old
mathematical block. Tests on finite fields are arithmetic controls for the
displayed signs, not constructions of CM schemes in positive characteristic.
The geometric CM constructions here are in characteristic zero. Inapplicable
parameters are excluded explicitly: c,N≥1; no residue field of size 1; no
division by a noninvertible class number; no universal abelian scheme on an
arbitrary coarse space; no extension of a compact-curve assertion to a
noncompact boundary without the existing modular compactification.

| Statement(s) | Instances tried and result | Change or retained boundary |
| --- | --- | --- |
| 0a.1: restriction, kernel, transitivity and conjugation | c=d gives identity and trivial kernel; K=ℚ(i), 1\|3 gives class groups 1 and C₂; D=−23 gives C₃ with inversion and S₃ over ℚ; ζ=2 in 𝔽₇ has inverse 4 | Tower maps use actual existing orders and fields; p=2 is allowed but no ℤ_p/procyclic conclusion follows. |
| 0a.2: pair, kernel, degree, endpoint orders, principal change, descent and actions | N=1 identity; Gaussian norm 5 kernel generated by (2−i)/5; Eisenstein norm 7 kernel generated by (3+ω)/7; (2) has kernel (ℤ/2)², not C₄; Gaussian conductor 3 has two ideal classes and only two units | All K retained; gcd(c,N)=1 and cyclic quotient are explicit. Inert prime level fails; a ramified prime occurs only once. Coarse H_c-point does not choose a universal curve. |
| 0a.3: embedding/pair inverse laws, stabilizers and arithmetic actions | Gaussian matrix ((2,−1),(5,−2)) squares to −I; Eisenstein ((−3,−1),(7,2)) satisfies M²+M+I=0; both determinant 1. Transposed level condition rejects the first. N=1 recovers imported classification. Restricting a maximal-order embedding to O_3 is not optimal | Row convention and lower-left divisibility fixed by Lean examples; full endpoint orders and selected CM type retained. Split count 2^s is not applied to ramified primes. |
| 0a.4: CM point, stabilizer field, level/Hecke maps, reciprocity and split comparison | Identity level map; finer level shrinks stabilizer and enlarges field; split Gaussian/Eisenstein comparison retains units 4/6. Single active cocharacter has conjugates equal to the basis cocharacters, hence the reflex norm is an isomorphism for this datum. Order-three action detects inverse arithmetic Artin | Character transport uses the computed r_z and σ_z. No assertion that every reflex norm of every Shimura datum is invertible. Non-neat coarse points remain available without universal fibres. |
| 0a.4: definite CM orbit | A definite algebra has no H± curve; the finite central quotient can identify ideal classes | Actual rational double-coset stabilizer retained, including the central quotient. No free Picard action or E×-stabilizer simplification asserted for this class set. |
| 0a.5: universal fibre, forgetting, base change, level and CM reciprocity | Identity base change and identity cover; non-neat inertia [−1] acts by −1 on ω; finer level can require a larger field; split comparison returns the elliptic triple | Generic PEL fibre is imported, not reconstructed. A nonzero cotangent vector is additional data. Stack/neat-cover descent uses its actual inertia action. |
| 0a.5: Brooks surface, ideal/principal transport and homogeneity | Unit ideal identity; (2) has Na=4 and surface degree 16, versus Morita kernel order 4 and elliptic degree 4; φ_[2]^*(ω/2)=ω; ω↦2ω divides a weight-two value by 4 and its square by 16 | Brooks's N⁻>1 surface has complex dimension 2. An auxiliary dimension-4 PEL realization is not substituted. N⁺>3 fine moduli and the small-level cover/stack case are distinguished; ray and ring-class fields are not identified. |
| 0.5: Artin convention | Identity ideal; D=−23 order-three class distinguishes a from a⁻¹; units at D=−3,−4 do not alter inverse-ideal action | Imports 0a.2 rather than defining a second cyclic pair. |
| 0.12: conjugation/Atkin–Lehner direction | N=1 identity; D=−23 and a norm-two generator g give w₂(1,𝔫)=(g²,𝔫̄), and w₂²=1; replacing g² by g fails. Gaussian level 5 retains extra units | Added Gross I §5 (5.1)–(5.2) and the explicit C₃×orientation Lean witness. Analytic odd-D hypotheses elsewhere are unchanged. |
| 8.2 and 8.8: isotypic space and finite orbit sum | Trivial group; zero vector; C₂ sign gives (1,−1); C₃ over 𝔽₇ gives (1,2,4) with shift eigenvalue 4, not 2; invariant vector and nontrivial character give zero; characteristic dividing group order gives zero average | Finite representation definition has arbitrary field coefficients. Arithmetic projector use requires invertible cardinality. Actual CM orbit supplied by 0a and Layer 3. |
| 8.9: probability versus torus volume | Two-term sign average is (1/2,−1/2), pairing 1/2 versus trace pairing 2: factor 1/4. Trivial group has factor 1. K=ℚ(i) completed L(1,η)=1/4 | Preserve h⁻², complex volume factor v² and the simultaneous CST/YZZ height and curve-volume comparisons. χ_T and χ_G identified only by reciprocity. |
| 8.10: toric functional | With χ_G(σ)=2, Galois action scales by 4; if σ_z(t)=σ⁻¹, right translation scales by 2. χ_G=1 gives an invariant trace; zero point gives zero functional. Wrong central character prevents descent | Fix the former conflation of inverse lattice action, Galois eigenspace and toric character. χ_T=χ_G∘σ_z determines the Hom space and analytic L-function. |
| 8.11–8.14: global formula, zero Hom and scalar derivative comparison | Trivial character recovers previous constants; C₃ transport changes the point labels while the analytic character remains χ_T; zero local Hom forces the point functional to vanish; zero derivative and zero pairing require no division by a vector value | No constant or general totally-real/quaternionic hypothesis weakened. χ_G labels point components and χ_T labels local integrals, signs and L-functions. Source proof boundaries remain explicit. |
| 8.18: positivity and nonvanishing consequence | Zero derivative; nonzero point component; inverse/dual components and coefficient embedding | Remove downstream rank/Sha deduction as a construction dependency; retain the point-height consequence with its existing positivity hypotheses. |
| 9.9: CM Maass derivative, toric norm, conjugation and algebraic value | j=0 gamma factor; each nonempty N⁻ factor (ℓ−1)/(ℓ+1); ω↦2ω scales weight-two square by 1/16; principal χ_j inverse factor cancels weight k+2j homogeneity; wrong differential transport fails; absolute square cannot lose W | Own the exact comparison with Brooks's triple and cover descent. Keep odd discriminant restriction on the local constant; the split modular specialization uses the separate elliptic construction. |
| 9.14: root/square adapter | Zero root, root multiplied by a unit or nonunit, group-like factor varying with character, square multiplied by the square of the normalization | No main-conjecture supplier; root normalization, fixed tame branch and integral measure remain the existing earlier inputs. |
| 9.17: ideal-indexed BDP point | Unit ideal; inverse class action; χ=1 hides inversion while an order-three character detects it; D=−3,−4 allowed geometrically but not inserted into an odd-discriminant analytic theorem | Repoint geometry to 0a.2. Keep all BDP/weight-two interpolation hypotheses; convert ideal and Galois sums explicitly. |
| 9.20: local Kummer/Bloch–Kato logarithm | P=0 and torsion give zero; formal small point gives formal logarithm; localization of the global boundary equals κ_v; residue degree f>1 uses φ^f and q=p^f; eigenvalues have absolute value q^(−1/2), so no fixed vector; no extra exclusion of p=2 for the general good-reduction comparison | Correct global H¹_f overclaim. The good local comparison is imported from L1; no global Euler-system or Selmer condition follows. The BDP formula retains its separate prime hypotheses. |

The following edits change only prerequisite names, layer dependency summaries
or supplier prose, not theorem hypotheses or conclusions. Their existing
Checks were re-read while verifying that the replacement actually supplies the
same object. This inventory includes the last target of a layer when only
that layer's following dependency summary changed.

| Blocks | Replacement check and outcome |
| --- | --- |
| 1.5, 2.15, 3.13, 4.7, 5.6 | Summary dependencies now use the early CM comparisons; height, intersection and toric data retain their own definitions. No forward Euler-system import. |
| 6.4, 6.28, 6.75, 6.78 | Degree-zero CM cycle uses actual 0a points and Layer 3 ξ; at degree 1 subtract ξ, at zero cycle get zero. 6.75 uses the definite class-set map, not an elliptic Picard-torsor assertion. 6.28 needs only its modular cyclic points. |
| 7.2, 7.18, 7.21, 7.57, 7.61, 7.70, 7.80, 7.109 | Earlier CM exports named exactly; underlying cyclic diagram, maximal/Eichler order and reduction inputs kept separate. Gaussian/Eisenstein stabilizers, unit-ideal isogeny and inert/ramified distinctions remain valid. Purely modular targets do not acquire an unnecessary quaternionic prerequisite. |
| 8.4, 8.5, 8.6, 8.15, 8.16, 8.17, 8.19, 8.20 | Curve/point imports now 0a and Layer 3. Identity map, zero point, u=1,2,3 and conductor 1 remain permitted as stated. No change to the accepted 8.17 CST constant or its two Skinner cases. |
| 9.10, 9.11, 9.12, 9.13, 9.15, 9.16, 9.18, 9.22 | Triple/field imports use 0a.4–0a.5; differential/degree imports use 3.5/3.9; anticyclotomic quotient uses AutomorphicPadicLFunctions L0. Identity isogeny and factor c²/c⁻² remain consistent; zero root does not imply a unit; no generic class character is asserted to factor through Γ. |

## Lean signature and pin comparison

Read every declaration against its section variables and the corresponding
README scope. The suggested file is 307 lines: nine real-bodied light
definitions, six admitted theorem signatures, and 24 proved examples. The
eight new examples prove arithmetic controls on existing Mathlib carriers;
they do not claim to construct the heavy CM or Shimura objects.

| Declaration family | Boundary checked |
| --- | --- |
| `unitIndex`, `unitIndex_of_imaginaryQuadratic` | Rational half of torsion-unit order for any number field; the {1,2,3} conclusion has degree-two and totally-complex hypotheses. |
| `completed_derivative_at_central_zero` | N>0, differentiability at 1 and L(1)=0, with full Γ_ℂ giving √N/π; no central-zero conclusion without its hypothesis. |
| `rankinPolynomial`, `rankinKernelPolynomial` | n=0,1,2 and r=0/top degree checked; factorial and t/2 retained. Formal finite expressions exist outside the arithmetic range, but the analytic use requires r≤k−1. |
| `chiIsotypic`, `heegnerFinite`, `heegnerAverage` | Arbitrary field, finite commutative group, actual representation; zero module and trivial group included. Cardinal inverse in characteristic dividing the order gives zero, not an idempotent onto the whole eigenspace. |
| `heegnerAverage_isotypic`, `heegnerAverage_pairing` | Inverse-character reindexing valid even for zero average. Pairing theorem requires nonzero cardinal in the field and uses its inverse square; arbitrary bilinear codomain retained. |
| `bdpLFunction`, `bdpIncomplete`, `bdpLFunction_evaluation` | Arbitrary commutative rings and a supplied root/unit; empty removed-factor set, zero root and ring-map evaluation. No measure existence or analytic interpolation theorem encoded by a free series. |
| `bdpEulerFactor`, `bdpEulerFactor_ne_zero` | p,a rational; p>1 and real Hasse bound; p=1,a=2 gives zero. Formal nonvanishing does not imply p-adic unit. |

Elaboration pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474`.
Current-read comparison used TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the reviewed library audit,
the current ModularCurves and GlobalNumberFields roadmaps and suggested
files, the close supplier contracts, and object searches in the current
library. In particular the current implementation already has
`TauCeti.GlobalNumberFields.NumberFieldOrder` and its `Hom.mapPic`, identity
and composition laws; 0a.1 imports these rather than redeclaring them.
The present library search found no CM point, ring-class-field, reflex-norm
or false-elliptic-surface construction supplying these additional comparisons.
The pinned-file statements use Mathlib only and introduce none of these
unavailable geometric carriers. The existing two-version height convention
in 0.1 is preserved.

## Sources read for the changed comparisons

The following are locators for the statements used, not transcriptions of the
sources. All added repository prose is in this worker's own words.

| Source | Passage used |
| --- | --- |
| [Gross, Heegner points on X₀(N)](https://www.wstein.org/papers/bib/gross-heegner_points_on_X0N.pdf) | §§I.1–I.3, pp.87–89, lattices, proper invertible ideals and Heegner levels; §I.4 (4.1)–(4.2), pp.89–90, conjugation, class field and arithmetic Artin action; §I.5 (5.1)–(5.2), p.90, inverse level-ideal Atkin–Lehner action. Scanned pages read visually. |
| [Gross–Zagier 1986](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf) | I §3 p.227, unit factors; II §1 (1.3)–(1.5), pp.235–236, cyclic points and quadratic equations. Their analytic discriminant assumptions are not imposed on the elementary geometric construction. |
| [Conrad, Gross–Zagier revisited](https://library.slmath.org/books/Book49/files/05conrad.pdf) | Introduction p.69, proper-ideal/Artin convention and exceptional unit factors. |
| [Cai–Shu–Tian v2](https://arxiv.org/abs/1408.1733v2) | §1.1 pp.1–3, cyclic proper-ideal and definite CM evaluations; §1.2 pp.4–6, actual quaternionic fixed points, reciprocity and point integral; §2.3 pp.17–19, class-number, height and volume conversion. |
| [Zhang, Arithmetic of Shimura curves](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf) | §2.3 pp.579–580, CM points and reciprocity; §4.2 p.587, point integral and formula conventions. |
| [Brooks](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content) | §§2.1–2.5 pp.4182–4188, order, surface, positive involution, fine level and ideal action; Theorem 2.2 p.4185 and Proposition 2.3 pp.4185–4186; §8.2 p.4232; §8.3 p.4233, triple and differential transport; §8.4 p.4236, chosen H-differential and periods. |

The earlier supplier contracts were read directly: CM §§1.1–1.2, 2.3 and
3.1; ClassFieldTheory 11–13; GlobalNumberFields 11; IntegralLattices B5;
ShimuraVarieties §§4.1–4.4 and 8.5; HilbertModularVarietiesAndShimuraCurves
R18.1–R18.3; PELModuli M1.13, M2.8–M2.9, M4.1, M6.2 and M6.9;
PadicHodgeRegulators L1; and AutomorphicPadicLFunctions L0/L3h for the
already separate anticyclotomic quotient. Fine-level reciprocity does not
provide a canonical chosen differential; generic R18.2's auxiliary PEL
realization does not provide Brooks's surface without comparison.

The previous review's two YZZ book-proof inputs remain explicitly named in
the README: Proposition 5.8 and Theorem 7.8(4). No copy of that book was used
and no book-proof verification is claimed. Their public statement sources
and existing owned proof targets are retained. No source passage or private
source file is included in this submission. No suspicious instructions were
encountered in fetched material.

## Validation and remaining work

- `lean-check research/blueprint/packages/GrossZagierAndArithmeticHeights/Suggested.lean`:
  exit 0, no errors, exactly six warnings that the milestone declarations use
  `sorry`. Memory was checked before compiling. No lake build/update/cache or
  language server was started.
- `python3 scripts/check_blueprint.py` on the main GZ packet, `--GZ.0`
  packet and `--GZ.8` packet: each reports zero errors and zero warnings.
- Internal audit: 292 distinct target anchors; all 287 previous targets
  retained; 942 internal links resolve; 767 internal Needs edges are acyclic;
  no `HeegnerPointEulerSystems` or `HE.n` supplier occurrence in the README.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  four files, zero problems.
- `git diff --check`: passes. Only the four issue deliverables changed.

The package fix is complete. The separate downstream repointing and packet
propagation described above remain outside this job. The missing named
adversarial report is an evidence limitation recorded for the independent
reviewer, not a claim that unseen findings have been checked. This handoff
is self-contained and needs no scratch files.
