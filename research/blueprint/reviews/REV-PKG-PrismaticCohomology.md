# Independent package review: PrismaticCohomology

**Verdict: needs_changes.** The review is complete, with the corrections below
applied to the package. Two newly identified arguments remain incomplete:
the derived-input example in §2.14, and the unrestricted chart model and
coordinate-merging naturality in §8.40. The broader comparison theorems also
retain explicit supplier extensions which their named suppliers do not yet
provide. These are mathematical closure defects, rather than failures of Lean
elaboration. The package is not ready for an upstream draft in its full range.

Reviewer: Codex, session `codex-6c8mLq`, issue #9233, 2026-10-14. The package
author was Codex session `codex-r34hIf` on #9189; this reviewer did not write
that package. This is the single fixing package review, not a checkpoint.
The accepted PR.0 and PR.8 packets were read without modification.

## Scope and structural evidence

The quality models were the current upstream AdicSpaces and
AlgebraicVectorBundles READMEs and suggested files, together with
UPSTREAM_GUIDE.md. I read the primary statement, standing and local
hypotheses, API entries, Checks and worked examples of every accepted target,
and the additional local foundation prefixes. Delicate proof paragraphs were
checked against sources as described below. This was not a verification of
every proof paragraph or every reference in the approximately 1.5 MB README.

An anchor-based reconciliation gives:

| Item | Result |
| --- | --- |
| Accepted targets | 290 from PR.0 and 79 from PR.8; all 369 retained |
| Definition/construction targets | 44 definitions and 83 constructions; all 127 retained |
| Accepted API entries | All 835 retained, allowing the README's uniform omission of the outer `TauCeti.` namespace |
| Checks | 494 in the packets; 503 named Checks in the corresponding README target blocks after fixes |
| Minimum Checks | Every one of the 127 definition/construction blocks has at least three |
| Lean inventory | Every accepted definition/construction title occurs in the closing inventory or as a kept declaration |
| Internal prerequisites | No broken explicit anchor links, upward-layer prerequisite links or cycles in the explicit linked prerequisite graph |
| Metadata | Unchanged single line `topic = "math.AG"` |
| Suggested file | 401 lines; light definitions over existing carriers, theorem signatures and examples; no sorry-bodied data definition |

One Check name changes intentionally:
`DerivedLogPrismatic.zeroLog_not_discrete` becomes
`DerivedLogPrismatic.zeroLog_cotangent`. Its original conclusion did not follow
from its premise. The replacement computes the cotangent complex and the
first graded piece without making an inference about the full filtered
complex. No accepted target or API entry was removed. Where the original
generality is unsupported, it remains an explicit extension target alongside
the narrower construction.

The README retains prose layers, exact sources and hypotheses, API lists,
Checks, examples and boundary contracts. I removed several process phrases
and a source phrase, and corrected stale upward ownership references in proof
paragraphs. The package contains no copied source passage or sequential
summary of a source. The packets remain authoritative inputs; this review
records where a mathematical correction changes an inherited assertion.

## Defects that remain

### 1. Derived input: §2.14

For `R = Ā ⊗̂ᴸ_{Ā⟨x⟩} Ā`, the cotangent calculation and Künneth expression
are justified. The displayed conjugate graded pieces alone do not complete
the claimed calculation of the reduced or unreduced prismatic complex.

The finite conjugate stages preserve the indicated negative cohomology, but
the argument must prove survival through the derived p-completed colimit.
Even after that, nondiscreteness of the unreduced complex needs a separate
argument. For `I=(d)`, the discrete A-module `A/I` has
`H⁻¹((A/I)⊗ᴸ_A A/I)=I/I²`: negative cohomology after derived reduction is not
a test for nondiscreteness before reduction. BS22 Construction 7.6, p.56,
constructs the functor; it is not a source for the stronger example.

The README now marks assertions (2) and (4) as unresolved and includes this
negative control. Resume by computing the unreduced complex or supplying the
necessary completion and flatness argument. Non-isomorphism with A follows
from the reduced calculation if established; it does not settle the stronger
nondiscreteness assertion.

### 2. General log q-de Rham charts: §8.40

The displayed basis formula needs the coordinate sections and hence
`M_D ⊕ ℕ^S ⊂ N`. An arbitrary submonoid of `M_D^gp ⊕ ℤ^S` does not supply
them. At p=2, take `N=2ℕ⊂ℤ`: its generator is `Y=X²`, with integral logarithmic
form `dlog Y`, while `dlog X` is unavailable. Rewriting the proposed
`(1+q)Y dlog X` in that basis needs division by 2; `1+q=2+(q−1)` is not
divisible by 2 in `ℤ₂[[q−1]]`.

Likewise, the ordinary pullback of logarithmic differentials under
`X₀,X₁↦X` is not a q-complex map: it carries the differential of `X₀X₁`
to `2X² dlog X`, whereas the differential of the image is
`(1+q)X² dlog X`. The difference is `(q−1)X² dlog X`.

The README now scopes the displayed construction and comparison to charts
containing the coordinates and coordinate-injective maps. It keeps the full
range of K1 Constructions 7.15–7.16 and Theorem 7.17, pp.43–44, as explicit
targets for an integral replacement model and coherent comparison maps.
I did not construct those maps during this review. This also prevents the
downstream semistable gluing argument from treating an arbitrary chart map
as a termwise map of q-complexes.

### 3. Supplier extensions and comparison ranges

The packets record 28 historical input gaps (25 plus 3). They are not 28
currently unresolved gaps: some have local owners or are already in their
suppliers. In particular, I corrected two outdated missing-input claims:

| Input now supplied | Exact accepted supplier |
| --- | --- |
| Descendable algebra, Amitsur module descent, tensor/base-change coherence, uniform-index filtered colimits | `EnhancedDerivedSheaves:E5:abstract/descendable-algebras`, `module-descent-and-functoriality`, `uniform-index-colimits` |
| Filtered category, completed Day tensor, Beilinson t-structure and heart | `DerivedDeRhamCohomology:DD.1/filtered-modules`, `filtered-completion`, `completed-filtered-tensor`, `beilinson-t-structure`, `beilinson-heart` |

Their accepted statements were read. E5's uniform bound is the bound for
filtered colimits with fixed source and finite cohomological dimension; it
does not construct the operation P⁰. DD.1's t-structure does not supply all
the E_∞ and lax monoidal compatibilities needed for prismatic décalage.

The following are the remaining range obligations, already stated under
the README's additional mathematical inputs. They should be closed with
actual named supplier targets or local prerequisite chains, not by treating
a request as an available theorem:

| Range obligation | Why the existing input is insufficient |
| --- | --- |
| Cofree Witt delta algebra and adjunction | First two Witt coordinates do not construct the higher integral polynomials or both adjunction identities; BS22 Remark 2.7, pp.14–15 |
| Complete-flat p-torsion control for every p-torsion-free bounded prism | The argument currently requires pro-zero `(A/Iⁿ)[p]`; §1.24 retains that condition rather than using boundedness of A/I alone |
| P⁰ on E_∞-F_p algebras | Ordinary Frobenius and E5 descendability do not provide the power operation used in BS22 Lemma 8.4, pp.63–64 |
| Lax monoidal connective cover and E_∞ Bockstein/décalage | These exceed the accepted DD.1 filtered category and Beilinson heart |
| Bounded formal geometry combined with the quasisyntomic right Kan extension | SF.4's formal carrier and DD.5's affine basis must be connected by the stated formal-site and gluing theorem |
| Arbitrary pre-adic specialization | ClassicalAdicEtaleCohomology H1 supplies type-(S) formal schemes, not every pre-adic generic fibre |
| Étale delta algebraization and W₂ étale base change | Completion or formal smoothness alone does not prove the two inputs of BS22 Lemma 2.18, pp.17–18 |
| Global scheme lifting obstruction | DD.0's affine Ext classification does not provide the scheme Ext² obstruction of ALB23 Proposition 3.2.2, p.20 |
| Perfect-site base independence and arc comparison | The PerfectoidQuotients universal quotient construction alone does not prove BS22 Proposition 8.5 and Corollaries 8.11–8.12, pp.64–69 |
| Principal Artin–Schreier comparison including zero divisors and zero | A regular-localization theorem must be extended with Frobenius-compatible completed specialization |
| Flat G_m continuity and syntomic rigidity | Basic étale cohomology does not provide animated continuity, arc_p descent, the Beauville–Laszlo square or Nygaard graded continuity |
| Derived crystalline, Spec/Spa and formal-to-v descent | Ordinary crystalline/de Rham, lisse descent and an affine generic fibre do not imply the larger completed or geometric contracts |
| Almost continuous Galois functions in §7.21 | Almost identification with `Cont(G_K,O_C)` and then `Cont(G_K,A_inf)` needs the product-diamond acyclicity argument of FCRYS §6.4, pp.26–27 |
| Period theory over arbitrary perfect residue field, integral all-weight Kisin dictionary | R06.2's accepted finite-Q_p range and the effective finite-height dictionary are narrower than §7.21 |
| Full bounded algebraic Witt–Frobenius Riemann–Hilbert | Perfect/lisse correspondence does not provide arbitrary bounded étale sheaves and Rj_! used in KY Lemma 8.5, pp.86–88 |
| Log formal/non-fine and arbitrary-PD ranges | CR.5/DD.6 must match those precise carriers; CR.6's semistable-DVR theorem is narrower than the proper Cartier-type O_C comparison |
| Multiplicative q-comparison and arbitrary coordinate maps | §§5.22–5.23 need an E₁ comparison and a coherent family-indexed construction; the coordinate-injective complex comparison alone does not supply them |

Adic effectivity is a named mathematical input with an appropriate public
source (Stacks Tag 0D4B), not the ordinary vector-bundle equivalence. The
current Tau Ceti projective lifting results supply useful pieces, but their
endomorphism-completeness hypotheses and conclusion differ from effectivity
of a compatible tower. That distinction is now explicit in the boundary.

## Adversarial mathematics pass

Every primary target, definition, identity and local convention was included
in the pass, using the hypotheses of its block. The following layer table
records the families of instances; the following correction table records the
significant findings. Instance checking is evidence about the stated plan,
not a proof of all its theorems.

| Displayed layer | Targets | Instances and conventions checked |
| --- | ---: | --- |
| 0: delta algebra and prisms | 92 | p=2 and p=3, zero ring versus nonzero characteristic-p ring, p-torsion, δ(p), Witt cross term, zero/unit ideals, localization and radical saturation, empty/regular sequences |
| 1: relative comparisons | 27 | Final prism, zero reduction and empty cover, finite jointly flat cover, opposite-site arrows, degree-zero comparison, p=2 Cartier/Bockstein convention, pro-zero p-torsion hypothesis |
| 2: animated inputs | 29 | Free degree-one input, ordinary versus derived self-intersection, regular and singular quotient, derived reduction of a discrete module, cotangent shifts and p-completed colimits |
| 3: Nygaard | 26 | n=0 and n<0, I⁰=A, divided Frobenius and its product law, rank-one twist, noncomplete polynomial ring versus restricted power series, perfectoid and crystalline specializations |
| 4: absolute geometry | 31 | Empty/trivial quotient, dual-number Hodge–Tate stabilizer, Sen weight ±n, p=2 torsion units, final versus covering prisms, nonzero transversal faithful-flat chart |
| 5: q-comparisons | 26 | q=1, n=0, p=2, X versus X+1, coordinate identifications, completed coefficient sequences, toric and θ/θ̃ specializations, two-endomorphism Koszul sign |
| 6: étale and syntomic | 33 | Derived fibre rather than kernel, n=0, weight 0/1/negative weight, t=0 localization, algebraically closed versus arbitrary residue field, the dyadic unit −1 |
| 7: F-crystals | 26 | Rank zero/unit crystal, effective and cyclotomic objects, θ versus θ̃, finite-Q_p versus arbitrary perfect-residue K, degree +1 filtered line, embeddings differing by a unit |
| 8: logarithmic theory | 79 | Trivial and zero charts, nonzero δ_log, nonintegral monoid exclusion, completed perfection, empty coordinates, missing and merging coordinates, semistable sign, boundary stalk versus global H¹, p-Kummer versus prime-to-p inertia |

| Block or convention | Computation / negative control | Applied correction or retained conclusion |
| --- | --- | --- |
| §0.57 radical localization | A=ℤ, p=2, S generated by 3 gives ℤ_(2), in which 5 is a unit; inverting p gives the zero ring | Added three discriminating Checks, including S={1}; ordinary ℤ[1/3] is not the result |
| §0.60 animated delta | A δ operation on π₀ and an ordinary Frobenius congruence omit the chosen derived point/homotopy | Replaced a weak Check by derived and δ-sensitive controls |
| §0.70 complete regular sequence | Empty sequence and a genuine nonzerodivisor sequence have different content | Replaced a vacuous regularity Check |
| §2.6 deformation locator | Scheme Ext² obstruction versus an affine Ext classification | Public ALB23 locator replaces the uncleared book locator; global supplier range remains explicit |
| §2.10 site agreement | Initiality among all prisms and cohomology on bounded prisms are different assertions | Corrected the bounded/all-prism wording |
| §2.14 derived example | Discrete A/I has negative cohomology after derived reduction | Removed the invalid inference, retained and marked the unresolved assertions |
| §3 worked examples | Ā[X] is generally not p-complete; root quotients also need completion | Replaced the large example by Ā⟨X⟩ and completed the root quotient |
| §4.6 coproduct input | A reference to an unspecified assertion “(2)” does not provide a coproduct | Stated the actual iterated-coproduct requirement |
| §4.10 conservativity | BL22 pp.43–44 makes the chart associated to a nonzero transversal prism faithfully flat | Retained the single-chart example after checking the proof; clarified the jointly conservative formulation |
| §5.16 completed H¹ | Σ_k [p^k]_q X^(p^k−1)dX converges but its required primitive has infinitely many coefficients equal to 1 | Replaced the direct-sum/coefficientwise-quotient description by the actual cokernel and added the completion control |
| §§5.23–5.24 specializations | Toric A_inf analogue and Σ_k p^k X^(p^k)dlog X at θ | Kept the completed cokernel; these classes cannot be discarded coefficientwise |
| Layer 5 cochain Koszul sign | d₁(u,v)=3u−2v gives d₁d₀=0; replacing subtraction by addition gives 12 at 1 | Corrected the claim about sign reversal and added two proved Lean examples |
| §6.18 Artin–Schreier | Surjectivity over an algebraically closed field does not establish it over an arbitrary field | Added the algebraically closed hypothesis to the global example |
| §6.24 weight one at p=2 | −1 is a nontrivial 2-power torsion unit of ℤ₂ | Corrected the dyadic torsion example |
| §7.12 period orientation | A_crys as the δ-envelope of φ(ξ)/p is the PD envelope for ker θ | Clarified the θ/θ̃ dictionary; no change to the source construction |
| §7.20 degree convention | φ=p⁻¹ and filtration jump 0 has t_N=−1 and t_H=0 | Degree +1 is correct and remains unchanged |
| §7.24 two embeddings | p and −p are distinct embeddings, but their image modules are related by a unit | Corrected the assertion that the modules themselves must differ |
| §8.1 nonzero δ_log | On ℤ_(2), α(n)=0 for n>0 and δ_log(n)=(3^n−1)/2 gives values 1,4 and unit factor 3 | Added an actual satisfying example; the Lean conditional dyadic test has a realizable p-local witness |
| §8.6 localization | Σ_n p^n x^(−n) belongs to the p-completion, not to ℤ_p⟨x⟩[1/x] | Distinguished algebraic localization from completed localization |
| §8.15 perfection | Raw Frobenius colimit need not be (p,I)-complete | Specified completed perfection |
| §8.27 Hodge–Tate form | The ratio class gives η(dlog X); η(dX)=X₀η(dlog X) | Removed division by a possibly nonunit coordinate |
| §8.40 chart model | 2ℕ at p=2; X₀,X₁↦X yields 2 versus 1+q | Added both negative controls and retained the broader comparison as an unresolved extension |
| §8.46 zero chart | The log cotangent complex is R→0 R in degrees [−1,0] | Replaced the claim about discreteness of the full cohomology by the exact cotangent and graded-piece test |
| §8.48 colimits | A⊔_A A=A in complete commutative algebras, while A⊕A differs in modules | Corrected the category in which colimits are taken |
| §8.62 log affine line | Boundary R¹ε_* stalk is ℤ/p^n(−1); y^p=1+pX gives a nontrivial ordinary étale class with trivial boundary inertia | Replaced the false global H¹ computation by the boundary-stalk statement and added the ordinary-cover control |

For the last control, a root of `1+pX` with constant term 1 would have
coefficient `binomial(1/p,m)p^m` of valuation `−v_p(m!)`. These coefficients
do not tend to positive infinity, so the root is not in `C⟨X⟩`. The cover is
étale since both p and y are units. It distinguishes ordinary global classes
from the boundary inertia detected by the log chart.

The local foundation prefixes were also checked: complete formal QCoh and
quotient descent (§4.0), general complete delta-base framings and the cochain
Koszul model (§5.0), the graded Beilinson square and filtered bundle dictionary
(§7.0), and arc/arc_p formal foundations (§2.0). They keep their mathematical
statements and discriminating tests.

## Fresh source checks

I opened the two locators flagged as unverified by the package author. The
five-page KY correction was read in full from the authors' public attachment,
with SHA-256
`005ee338ad8f6cb0adb297dfadcb7bca06bea7e817e5b97dc09ac0e5ea686b1f`.
Its Lemma 1, Definitions 2 and 4, Example 3, Proposition 5, Remark 6 and
Theorem 7, pp.1–4, support the corrected p-Kummer and Laurent-F essential
image used by the README. The original v1 Theorems 7.36–7.37 correspond to
published 7.35–7.36; the README's version distinction was retained. The
correction's theorem replaces the old full-local-system essential-image
claim, not just its terminology.

Illusie's book is not cleared for this run and was not obtained or read.
The global obstruction and first-conjugate-piece splitting/lifting locators
were instead replaced by the public ALB23 Proposition 3.2.2 and Corollary
3.2.3, p.20, which I read. This verifies the mathematical statement through
that source; it does not certify the old book subsection number.

A fresh pseudorandom sample, seed 9233, selected the following 15 other
target blocks. The relevant numbered statements and surrounding hypotheses
were read, not merely searched for their numbers. Pages are the cited PDF's
printed pages.

| Sample | Target | Verified locator and outcome |
| ---: | --- | --- |
| 1 | §5.16 framed q-de Rham | BS22 Construction 16.20, pp.114–115; corrected the construction page range and the completed H¹ example |
| 2 | §7.21 crystalline lattice | FCRYS §6.4, pp.26–27; almost continuous-function input remains an explicit extension |
| 3 | §1.24 syntomic H⁰ | ALB23 Lemma 5.1.6, p.76; retained the package's pro-zero restriction and explicit broader target |
| 4 | §5.22 all-coordinates AΩ map | BS22 Theorem 17.2, p.117, and BMS1 Theorem 9.4(iii), p.70; cofinal framing comparison holds, multiplicative/arbitrary-map input is separate |
| 5 | §0.11 Witt multiplication | BS22 Remark 2.4, p.13; the second-coordinate term includes p x₁y₁ |
| 6 | §0.63 distinguished prism generators | BS22 Lemma 2.25, p.19, and Lemma 3.1, p.28; local distinguished-generator assertions match |
| 7 | §7.12 Breuil–Kisin/A_inf covers | FCRYS Example 2.6, p.6; Construction 7.13, p.34; Notation 5.1, pp.15–16; Example 7.8, p.31; θ/θ̃ convention clarified |
| 8 | §8.11 prelog envelopes | K1 Proposition 3.6, p.15; bounded/orientable envelope range checked |
| 9 | §0.54 delta quotient | BS22 Definition 2.1, p.13; Lemma 2.9 and Example 2.10, p.15; stability, not ordinary Frobenius stability, controls the quotient |
| 10 | §2.6 conjugate splitting | ALB23 Proposition 3.2.2 and Corollary 3.2.3, p.20; BS22 Remark 4.14, p.40; public global deformation locator supplied |
| 11 | §0.15 equal Frobenius, different delta | BS22 Remarks 2.2–2.3, p.13, and Example 2.6, p.14; square-zero p-torsion family is compatible with the distinction |
| 12 | §6.3 perfectoid étale | BS22 proof of Theorem 9.1, pp.72–73; corrected the old p.71 proof locator |
| 13 | §3.22 Nygaard colimit | BL22 Corollaries 5.2.15–5.2.16, p.123; BS22 paragraph after Proposition 15.7, p.105; completed and I-inverted constructions distinguished |
| 14 | §7.2 crystal descent | FCRYS Theorem 2.2, p.5; Proposition 2.7, p.6; Example 2.8, p.7; punctured-formal Drinfeld–Mathew input exceeds the basic SF.1 contract |
| 15 | §8.62 affine Kummer comparison | KY Theorem 6.1, p.59; §1, p.6; Proposition 6.16, p.66; DLLZ Lemmas 4.4.27 and 4.4.29, pp.64–65; replaced global H¹ by the boundary-inertia stalk |

Additional fresh checks included K1 Lemma 2.11, pp.8–9; K1 Theorem 5.3,
Remark 5.4 and Corollary 5.5, p.27; K1 Constructions 7.15–7.16 and Theorem
7.17, pp.43–44; KY Construction 2.34, Definition 2.35, Example 2.37,
Proposition 2.39 and Lemma 2.40, pp.21–22; KY §4.3, pp.37–41; KY Example
2.30, p.19; KY Lemma 8.5, pp.86–88; FCRYS Notation 5.1, pp.15–16; and
BL22 pp.43–44. These confirmed, among other points, the Z_p tensor base for
the initial log prism, the zero-chart cotangent complex, and the
faithful-flatness assertion needed by the transversal chart.

The BS22 and BMS1 PDFs cleared by the maintainer were read in place; neither
their files nor any passages were copied into the repository or scratch.
The other source texts above were public author/arXiv PDFs. The repository
changes state the results in the reviewer's own words. Source sampling does
not certify every locator in this package.

## Libraries, current roadmaps and ownership

Pins used for the signature check: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
The 143 listed baseline declaration provisions were inspected in local
source, with the relevant namespace and hypotheses checked for the critical
interfaces. I corrected `surjective_fontaineTheta` to
`WittVector.surjective_fontaineTheta`; its nonunit-p hypothesis must still be
kept. Ordinary completion, ordinary derived categories and the naive
cotangent complex are not counted as the enhanced mathematical inputs.

The current read-only duplicate check used TauCetiRoadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched by delta/Witt/Frobenius,
prism, Nygaard, completion, projective lifting, vector bundles and the
associated hypotheses, across current roadmap READMEs and suggested files,
including all nine post-snapshot roadmaps and the four listed Completed
roadmaps. No exact duplicate of a retained prismatic target was found, so
there are no target removals.

Relevant partial reuse was read in the current library:

- `TauCeti/RingTheory/AdicCompletion/Idempotent.lean`:
  `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq`.
- `TauCeti/Algebra/Module/Projective/Lift.lean`:
  `TauCeti.exists_isIdempotentElem_endMapQ_eq` and
  `TauCeti.exists_projective_quotient_smul_top_linearEquiv`. These assume the
  relevant endomorphism module is r-adically complete and lift a projective
  quotient; they do not by themselves give compatible-tower effectivity.
- `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean`:
  `TauCeti.IsProP`, reused for p-Kummer inertia without a second pro-p theory.

The ordinary affine vector-bundle equivalence stays deferred to
TauCetiRoadmap.AlgebraicVectorBundles Layer 0B; the complete-tower variant
states how it differs. AdicSpaces is a geometry boundary, not a supplier of
the enhanced analytic étale sites. No Lake command was run in either current
read-only checkout.

The local downward ownership moves were already made by the package author;
this review corrected stale proof references and preserves the following
handoff map:

| Former upward input | Local owner |
| --- | --- |
| LP1 formal completed QCoh / infinite group nerve | Layer 4.0 |
| QW6 general complete delta-base framing | Layer 5.0 |
| RT3b/RT6 graded prismatic Beilinson square | Layer 7.0 |
| VB2 filtered Frobenius bundle dictionary and degree | Layer 7.0 |
| T6 fs log adic Kummer foundations | Layer 8.60 |
| ArcTopologyAndDescent formal arc/arc_p foundations | Layer 2.0 |

The formal/log prefixes are mathematical targets here, not upward imports.
No `FoundationsAndLibraryIntegration` or `UPSTREAM:` supplier is used as a
mathematical theorem. No other roadmap, packet or link map was edited.

## Lean signatures and validation

I read the whole suggested file. The ten representative signature checks are:

| Signature | README correspondence and hypothesis check |
| --- | --- |
| `Delta.correction_identity` | §0.2; prime p, arbitrary commutative ring, no cancellation of p |
| `Delta.correction_two` | §0.1; sign is −xy, including characteristic 2 |
| `Delta.associatedFrobenius_isLift` | §0.5; prime p and specified delta structure, existential ring map with the correct underlying function |
| `Delta.reconstruction` | §0.6; injectivity of multiplication by p, not just characteristic zero |
| `Delta.delta_prime` | Integer-scalar delta API; value 1−p^(p−1), with the p=2 value −1 |
| `Delta.no_delta_structure` | Characteristic-p negative control; prime p and nontriviality exclude the zero-ring exception |
| `Delta.quotient_structure_iff` | §0.54; quotient map commutes with delta iff its kernel ideal is delta-stable |
| `Delta.distinguished_prime_mem` | Distinguished-element API; δ(x) a unit yields p in (x,φ(x)), without cancelling p |
| `QCrys.qInteger_mul_sub_one` | q-integer convention; polynomial sum, arbitrary q and n, including q=1 and n=0 |
| `Log.frobenius_chart` | §8.1; specified prelog homomorphism and full logarithmic delta axioms, with the multiplicative correction factor |

The elementary Lean delta structures are polynomial data over arbitrary
commutative rings. The README explicitly distinguishes this prefix from
the p-local complete prismatic geometry; no general geometric conclusion is
inferred from the broader polynomial carrier. The logarithmic dyadic
conditional example is an identity following from the axioms, and the
README now supplies an actual p-local witness for its premise.

`lean-check` exited 0 on the original file and on the final corrected file,
with exactly 25 warnings, all `declaration uses sorry`, and no other warnings
or errors. The added two-endomorphism Koszul examples are proved by `ring`
and `norm_num`. The closing inventory was also reconciled and reflowed.
Free memory exceeded the worker threshold. No language server, Lake build,
cache fetch or library update was started. Elaboration with sorry checks
typing; it neither formalizes the prismatic theory nor proves the roadmap's
mathematical claims.

Both accepted packet validators returned 0 errors and 0 warnings. The intake
file check returned 6 files, 0 problems, and `git diff --check` passed. The
structural reconciliation above is a separate read-only check.
