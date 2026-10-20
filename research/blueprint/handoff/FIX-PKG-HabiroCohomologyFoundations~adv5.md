# Habiro foundations: Part I supplier repair

Issue #11435; agent Codex; session `codex-tmqwDm`; 2026-10-20.

The Part I repair is complete. The fix assessment is **accepted**, as requested
by this fix issue; this is not an independent review or a claim that the targets
have been formalised. The package now constructs its cohomological completion,
finite cyclotomic descent and étale coefficients before the q-Hodge comparison.
There is no Part I supplier edge to HabiroRings, HabiroCyclotomicCompletions,
RefinedTraceMethods or HabiroCohomologyFoundationsPartII. The final inventory
lists every subsection's suppliers, including conditional and analytic inputs.

The maintainer's order for the family is Part I → HabiroRings →
HabiroCyclotomicCompletions → RefinedTraceMethods → Part II. This replaces the
conditional HC → HR → I order in the previous handoff. Only the four paths
authorised by #11435 changed: README, Suggested.lean, review.json and this note.
Other packages and the legacy packets were read, not edited. This report
certifies the Part I side, not every transitive edge in those other plans.

## Finding dispositions

The requested `REV-PKG-HabiroCohomologyFoundations~adv.md` is absent. Read the
available base, `~2`, `~3` and `~codex4` reports, the previous review result and
`FIX-PKG-HabiroCohomologyFoundations~adv4.md`, and the Part II `~codex1` review
and relocation manifest. Their mathematical findings were checked as data.
No commands from review countermodels or fetched sources were executed.

| Finding | Disposition |
| --- | --- |
| Part II R1 / adv4: Part I imports its trace consumer | Preserved the removal of old Layer 6 §§6.1–6.5, old §8.1's trace clause and old §9.15's trace comparison. No trace theorem is reintroduced. Scope, Exact supplier contracts, aggregates, §§4.28/5.26 and Downstream consumers all keep RT and Part II downstream. |
| Adv5: HR-derived and HC suppliers remain in Part I | Added §§0.1–0.3 with actual enhanced completion, finite complete descent and marked étale deformation constructions. Replaced HR.1/HR.4 arithmetic inputs by their existing QW.1–QW.4 owners. Retargeted every HR.2/HR.3 use to the new local constructions. Replaced HR.5's coefficient use and HC.3's Taylor use in §3.31 by finite cyclotomic descent and semilinear coordinate scaling. |
| Adv5: independent étale contracts at §§4.21/4.28 | Expanded §4.21 into a natural marked E∞ comparison, with partial completions, q-Witt Frobenius transitions, staticity and the canonical h-completion map. Its ordinary-model characterization is a contract HabiroRings consumes. Section 4.28 exports that comparison with the existing full coherent descent datum. The number-field/rootwise model identification is explicitly a later HR theorem. |
| Adv4 R2: HC's duplicate `ordinaryDerivedComparison` | The donor deletion has landed in HC §5.5, with the ordinary polynomial-module exactness and arbitrary-module boundary retained. Its current fix assessment is accepted for #11421. No edit outside this issue is repeated. HR §2.4 remains the ordinary/derived model comparison owner, consuming the cohomological completion contract here. |
| Adv4 R3: RT's obsolete HR.6 étale input | The retarget has landed: RT §6.14 imports Part I §§4.21/4.28. The current independent RT review is accepted for #11415 (`REV-PKG-RefinedTraceMethods~codex3`, session `codex-jZgsnT`). This fix supplies the promised independent algebraic contracts. |
| Adv4 R4: framed trace ownership | Current RT §6.10 supplies the full framed comparison, including the prime-two and diagonal-completion conditions; Part II consumes that theorem. Preserve that division. Part I's §3.31 is an independent algebraic Koszul construction and comparison target, not a trace theorem. |
| Base R1: arbitrary unrelated module families | Preserved the actual enhanced functor, fixed comparisons and coherent gluing domain. New conservativity explicitly requires Habiro completeness; the nonzero module ℚ(q) rejects its extension to arbitrary modules. |
| Base R2: arbitrary perfectoid generators | Preserved the actual quotient/prism and distinguished-generator hypotheses in HQ.4. Neither a chosen arbitrary element nor an arbitrary Frobenius is substituted. |
| Base R3: fake cotangent/free-δ witnesses | Preserved the full derived cotangent and free p-complete δ-ring constructions and higher-power boundary. No surrogate static record was introduced. |
| Round 2 R4: unconstrained envelopes | Preserved fixed PD/q-PD presentations, their universal maps and convergence hypotheses. Layer 0 is not an arbitrary ring-and-map interface; it specifies localization, complete categories, marked deformations and proof routes. |
| Round 2 R5: arbitrary ambient categories | Actual enhanced D(A[q]) and symmetric monoidal complete categories are required. Finite descent is proved from tensor-compatible completion reflectors. Arbitrary categories with isomorphisms do not satisfy this contract. |
| Round 2 R6: ordinary quotients in derived statements | All new quotients and limits are derived. The B/(q−1) witness retains both degrees −1 and 0 after derived h-reduction. Staticity of limits is proved by reduction detection, not assumed. |
| Round 2 R7: fake degree-zero q-Witt/ghost systems | Directly import QW's initial relative q-FV-system, balancing ideal, twisted cyclotomic ghost targets and étale pushouts. Zero rings or an arbitrary rational ghost product cannot replace this supplier. |
| Round 2 R8: arbitrary framed comparison | Retained the canonical framed filtration and its hypotheses. The uncompleted comparison is now explicitly named `FramedHabiroKoszul.compare`, with its missing full proof visible; no arbitrary equivalence is asserted to be the comparison. |
| Round 3 / codex4: normalization and export corrections | Preserved all native definitions/signatures and existing proved witnesses; full divisor coherence, degreewise completion, graded localization, conditional E_n refinements, finite-projective base-change conditions, actual finite-coefficient overlaps and quotient-map directions remain. Reconciled §4.12 with §4.28: a factorial chain computes the limit but does not replace the full coherent divisor diagram. |
| Solid input mixed with algebraic completion | Section 6.3 records bounded-below solid tensor compatibility as a named obligation on the analytic target HS.3. Algebraic completion/descent does not import an HR solid theorem or assume an analytic equivalence. |

## Ownership moves and conservation

These are specialized cohomological constructions moved downward, not a
replacement for generic completion, the ordinary Habiro toolkit or Taylor
analysis. The downstream owners should point their comparisons at the new
contracts when integrating the maintainer's order.

| Former input or presentation | Owner and retained boundary |
| --- | --- |
| HR.1 arithmetic Λ-data/perfect coverage | Existing QW.1, with PR.0 for δ/étale lifting. Completed étale Frobenius is QW.4 through that input. No second Λ-ring theory is planned here. |
| HR.4 degree-zero relative q-Witt theory | Existing QW.2–QW.4. HQ.4 here still owns positive-degree calculus and its comparisons. QW.5/QW.6:framings are aliases for those shared interfaces, not reverse supplier edges. |
| HR.2 Habiro module completion and tensor | New §0.1, specialized from DD.1's generic enhanced completion. HR retains ordinary-model comparisons and its separate solid spectral applications. |
| HR.3 complete cyclotomic reconstruction | New §0.2, with full intersection diagrams, mapping spaces and semilinear naturality. Ordinary root-adjoining/Taylor statements remain downstream. |
| HR.5 cohomological étale coefficient model | New §0.3 and §§4.21/4.28. HR's ordinary Frobenius-glued presentation is identified with this model using its marked partial completions; it is not assumed here. |
| HC.3 Taylor input to the framed construction | No such input remains. Section 3.31 constructs scaling on complete cyclotomic pieces and descends it. HC retains integral Hasse coefficients and convergent re-expansion as later results. |
| HR.5 finite-étale Taylor input to §5.25 | Use E(R/A) and its canonical h-completion, constructed here. The GSWZ/rootwise presentation and number-field ring comparison remain later HR results. |
| HR.2 bounded-below solid tensor | Not an algebraic input. The conditional analytic comparison's target must supply the actual solid category, bounds and continuity estimates (§6.3). |

Legacy packet integration is outside the four authorised paths. In particular,
QW.2's older roadmap description imports its cyclotomic polynomial arithmetic
from HC.4, and the current HR package still lists classical HC inputs. Those
owners need their own ordering/integration edits; this fix does not certify
those transitive graphs or silently remove their targets. Part I's direct
arithmetic supplier is QW.2 (QW Lemma 2.1), not HC.4. Its finite enhanced
descent is constructed locally. The old packet trace aliases likewise remain
subject to the Part II relocation manifest rather than edits in this job.

Conservation against the claimed base:

- All 148 old numbered subsections remain; only §§0.1–0.3 are added (151 total).
- All 294 existing named API bullets remain; 20 are added (314 total).
- Every old Check block is retained verbatim as repository-authored prose:
  48 old blocks, 53 total after additions in §§0.1–0.3, 4.21 and 6.3.
- No old native definition or theorem signature was removed or weakened.
  Suggested.lean has five real-bodied definitions, seven theorem targets,
  twelve proved examples and 226 lines. The characteristic-two cyclotomic
  identity extends an existing example rather than adding more examples.
- The independent PR.3/AI.1/HQ.4 Nygaard construction is still §8.15;
  the canonical θ and Witt map-equality targets remain §§8.18–8.19.

Trace conservation is unchanged from adv4: old §§6.1–6.3 go to Part II
§§1.1–1.3, old §6.4 to Part II §§2.1–2.2, old §6.5 to Part II §§4.1–4.2,
and the old §8.1 trace example to Part II §3.3. RT supplies the relevant
trace theorems. The old §9.15 trace comparison remains there; its independent
algebraic Nygaard content stays here. No trace range or spherical condition
is used to narrow the all-prime algebraic exponent-≥2 theorem.

## Adversarial pass

The following covers every substantive mathematical edit and all twelve native
definition/theorem statements. Supplier-only edits are listed separately. The
native signatures were checked against their actual variable blocks: arbitrary
commutative rings for polynomial calculus, a unit q for Laurent exponents, and
`Fact p.Prime` for the prime decomposition. Heavy enhanced carriers remain
README targets. Successful elaboration is not a proof of those targets.

| Statement or family | Instances / calculation | Result and change |
| --- | --- | --- |
| §0.1 reflection and towers | Zero module; coefficient unit; m=1,2; unit ideal. For M=ℤ[q]/h every f_m acts by zero and M/^Lh has M in degrees −1,0. The negative-degree transition in the product tower is eventually zero. | The RHom uses fib(B→S⁻¹B), with its map to B, so its unit has the correct direction and no cofiber shift. Ordinary reductions cannot replace derived ones. Exclude f_0. |
| §0.1 tensor and conservativity | M=N=L_H(B) returns the complete unit. For A=ℚ, ℚ(q) is nonzero, all cyclotomic reductions vanish and its reflection is zero. | Tensor is reflected tensor; no assertion that uncompleted tensors remain complete. Conservativity and degreewise detection are confined to complete objects. |
| §0.2 reconstruction and maps | m=1 has no overlap; zero algebra stays zero. At m=2, the two supports are comaximal over ℚ, meet modulo 2 over ℤ and coincide over 𝔽₂. Constants (1,0) fail the integral overlap. | A product formula without overlaps fails over ℤ and 𝔽₂. Added the proved native identity Φ₁=Φ₂ over 𝔽₂. Retain actual intersection mapping spaces, paths and higher homotopies. |
| §0.2 arithmetic and divisor naturality | m=6: both paths 6→2→1 and 6→3→1 carry the unit to 1. A sign-flipped unital comparison fails over ℤ. For m=12,p=2 the independent chains are indexed by 1,3, with any one of the three 2-primary levels. | No extra factor for each member of a p-chain. Rational product is after inversion and completion. Naturality is through completed scalar extension and ideal-preserving semilinear maps. |
| §0.3 étale coefficients and uniqueness | R=A, zero base, diagonal A→A×A, m=1,2. E_1=R[[h]], whereas qW_1=R. Over ℚ the flat complete lifts y²=0 and y²=h have the same non-étale reduction but differ by nilpotence. | Require étale reduction, completeness and the reduction marking. Unmarked abstractly isomorphic reductions do not give the comparison. Prove staticity using cyclotomic detection. |
| §0.3 completed Frobenius | R=ℤ[∛2,1/6], p=5. Modulo 5, x³−2=(x−3)(x²+3x+4); the quadratic has no root and gives an 𝔽₂₅ factor with nontrivial Frobenius. The fraction field has only the identity automorphism. R→R̂_5 is injective. | The completed Frobenius cannot descend to R. QW Corollary 2.52 rules out the naive untwisted q-Witt model and its completed lift. No global Λ-structure on arbitrary étale R. |
| §3.31 scaling, divided operators and Koszul model | Empty frame gives E in degree zero. Rank one: γ(x)=qx, D̃(x²)=(q²−1)x. On x⁻¹, γ multiplies by q⁻¹. In rank two, distinct coordinate scalings commute and fix the other's divisor. | The reduced semilinear map respects the tensor relation because q^d=1; lift it formally étale, verify the Frobenius overlaps and descend. Prove x-regularity and divisibility before dividing; no division by h. Multiplication by x rescales the degree-one differential. Full uncompleted comparison remains a named target with its proof obligation. |
| §4.8 framed pair | Rank zero; polynomial x and x²; Laurent x⁻¹; h=0. The completed differential on x² is (q²−1)x, not 2hx. | Keep the completed framed construction independent of rootwise Taylor calculus and of the later uncompleted comparison. Existing framing and base hypotheses remain. |
| §4.12 / §4.28 divisor coherences | m=1; the divisor diamond at 6; a finite three-arrow chain. Common arithmetic fracture projections compose before taking their enhanced pullback. | Require the full coherent divisor functor, then compute its limit on factorials. Cofinality alone is not a construction of the comparison homotopies. |
| §4.21 étale comparison | R=A, zero base, A×A, m=1,2 and the preceding cubic. Empty frame gives qdR=R[[h]], its h-adic pair and static E. At m=1 the transition is q-Witt F_m, not an invented restriction. | Natural marked E∞ comparison, complete partials and h-map constructed independently. Smooth non-étale A[x] has positive forms and is excluded from this degree-zero assertion. No lift, resolution or small-prime inversion hypothesis is added. |
| §4.28 exported record | Étale unit pair; β- versus t-localization; identity/divisor transitions; finite-projective A→A×A; flat ℤ→ℚ. | Preserve all six clauses, degreewise graded completion, actual ascending q-Witt filtration and the conditional E_n/derived-commutative and scalar-extension hypotheses. ℤ[[t]]⊗ℚ misses coefficients 1/(n+1)!, so flatness does not replace finite projectivity. RT and Part II occur only as consumers. |
| §5.25 étale algebraic cohomology | Identity algebra, zero ring, finite split étale algebra, arbitrary number-field degree. | Object is the local E and Taylor map its h-completion. The later GSWZ model comparison is not required to construct either. No factor 6 is imposed on the algebraic étale statement. |
| §5.26 finite-coefficient export | m=1; m=4 at p=2; m=12; exponent 1 versus 2; zero quotient. Quotient maps for m∣m′ are ℤ/m′→ℤ/m. | Preserve the actual uncompleted rational corner and C_p overlaps, constant rational filtration, staticity argument, all-prime algebraic range and contravariant maps. Only the downstream Part II note is added. The stronger spectral range stays with consumers. |
| §6.3 solid analytic boundary | Algebraic coefficient unit before any solid target; bounded-below versus nonuniformly bounded families; (∏ℤ)⊗ℚ versus ∏ℚ. | The sequence 1/(n+1)! rejects unjustified rationalization/product exchange. New named solid coefficient obligation belongs only to the open analytic comparison. |
| `qDiff`, `jackson_calculus`; §1.2 | Constants and x⁰ give 0, x gives 1, x² gives (1+q)x. At q=2, x²↦3x and x³↦7x²; at q=1 over 𝔽₂, x²↦0. Test the twisted product rule on x·x. | All commutative coefficients, including the zero ring and characteristic 2; no division or regularity assumption. Statements unchanged, proved examples retained. |
| `uniformDenominator`, `uniformDenominator_pos`; §1.8 | n=0,1 give 1; n=2 gives 64; n=3 gives 2¹⁴3²⁶. Every prime-power factor is positive. | Scalar positivity is the native assertion, not the construction of envelope maps. No signature change. |
| `torusScaleHom`, its action and uniqueness; §1.23 | Rank 0 is the coefficient algebra; q=1 fixes every monomial. Rank 1 exponent −1 gives q⁻¹. Rank 2 weights (2,−1) paired with (−1,3) give −5. The inverse is weight −a. | Unit q allows negative exponents. Zero and positive-characteristic rings obey the same character calculation. Coefficient-linear automorphism uniqueness and the action agree with the actual algebra carrier. |
| `coefficientRelation`, evaluation theorem; §2.2 | m=2: (q,β,t)=(2,3,1) gives 0, (2,2,1) gives −1. m=1 gives 0 at (2,1,1). m=0 gives 0 at (2,0,0). | Native evaluation identity is valid even for m=0; the cyclotomic theories separately exclude m=0. Variable order and βt=q^m−1 sign are fixed. |
| `qHodgeDiff`, polynomial theorem; §7.2 | Constants and n=0 give 0; q=1 kills every polynomial. At q=2, x²↦3x. At q=1, x distinguishes q-Hodge's 0 from Jackson's 1. | General commutative coefficients; no ordinary-derivative substitution. All original witnesses retained. |
| `cyclotomic_prime_decomposition`; §8.2 | p=2: Φ₂=2+(X−1), u=1. p=3: Φ₃=3X+(X−1)², u=X. In the binomial expansion at X=1, every intermediate coefficient is divisible by p. | Integral u with u(1)=1; p=0,1 excluded by the prime instance. Added characteristic-two support coincidence alongside the original prime witnesses. |
| Correction-sign negative control; §§5.26, 8.2 | 2=−(X−1)+(X+1); using plus instead evaluates to 4 at X=2. | Existing README and proved Lean witness preserved. |
| Locator-only edits; §§2.2, 8.19 | Read graded presentation in proof of QH Lemma 3.9, p.24, and BS Lemma 18.3 proof, pp.122–123. | Corrected those locators; no theorem or compatibility claim strengthened. |

The following sections change only their supplier labels: §§1.1, 1.19, 2.4,
3.1, 3.3–3.5, 3.7, 3.9–3.10, 3.14–3.16, 4.17–4.19, 4.27, 5.13–5.15.
Their hypotheses, constructions, API and Checks are retained. Read them
against the replacement supplier's domain: torsion-free or perfectly covered
Λ-bases where stated; positive m; actual relative q-FV objects; derived
cofibers; complete tensor for complete objects; finite-projective rather than
arbitrary flat base change. The existing zero, unit, p=2, smooth/non-étale,
dimension and tensor-domain tests remain. Noncompact topological groups are
not quantified inputs of these algebraic statements; no compactness condition
was removed or replaced by a trivial-group example.

## Source and library checks

All new statements are in our own words with theorem/section/printed-page
locators. Read QH §2.1–§2.2 (pp.13–19), Example 3.12/Corollary 3.13
(pp.25–27), and Appendix B (pp.77–80); QW Lemma 2.1 (p.8), relative q-Witt
construction (pp.30–32), and étale statements/proofs (pp.33–35); GSWZ
Definition 1.1 (pp.6–7) and §5.2 (p.64). The completion formula is specialized
from the countable localization telescope, and étale coefficients from marked
deformation through f_m-powers. Coherent diagram and semilinear constructions
are explicit roadmap obligations, not assertions that the source proves every
enhanced coherence.

The étale proof route does not use a claim that Φ_m is irreducible modulo
every prime coprime to m: for example Φ₃ has roots 2,4 modulo 7. Finite
cyclotomic complete descent and marked étale lifting avoid that step. Retain
all factors in a later root-adjoining Taylor comparison.

For the required additional source sample, used `random.Random(11435).sample`
on the original 148 numbered subsections to select fifteen locators. The table
records the source statements actually read, not excerpts or a paper synopsis.

| Section | Verified locator and boundary |
| --- | --- |
| 1.12 | QH Construction A.12, §A, p.75; the arithmetic pullback and rational framed comparison. |
| 1.24 | Sch Definition 7.3 and Remark 7.4, §7, p.15. The invertible semilinear modification is explicitly this roadmap's additional construction. |
| 1.26 | DAG VIII Definition 2.7.8 and Proposition 2.7.6, §2.7, p.71; flat sheafification at Proposition 2.7.14, p.72. |
| 2.2 | QH proof of Lemma 3.9, §3.1, p.24, and Theorem 3.11, §3.2, p.25; corrected the former locator. |
| 3.23 | QH Lemma 3.23, §3.3, p.32, proof pp.32–33; divided Frobenius and top-degree surjectivity. |
| 3.26 | QH Corollary 3.26, §3.3, p.35; quasi-syntomic descent and smooth agreement. |
| 3.28 | QH Proposition 3.22, §3.3, p.32, and Lemma 3.52, §3.8, p.50; filtered reduction. |
| 4.11 | QH Lemma 3.37, §3.5, p.42; invert p before lower-cyclotomic completion. |
| 4.19 | QH Theorem 3.11(a), §3.2, p.25, and Theorem 1.11(a), §1, p.7; the functor is on chosen pairs. |
| 4.22 | QH Proposition 3.47, §3.7, p.48, proof pp.48–49, and Remark 3.6, §3.1, pp.22–23. |
| 4.23 | QH Paragraphs 3.50–3.51 and Lemma 3.52, §3.8, p.50; carry supplied structures rather than create them. |
| 5.2 | QH Paragraphs 4.1/4.3, §4.1, pp.53–54; truncated canonical filtration and small-prime inversion. |
| 7.1 | QH Paragraph 1.10, p.6, Remark 1.13, p.7, Paragraph 1.17(c), p.9, and Remark 3.6, pp.22–23. |
| 8.14 | QH Paragraph 1.17(a), p.8; BS Notation 17.1, §17, p.117; Sch Conjecture 4.3, §4, p.9; BMS1 Remark 6.6, §6, p.50. |
| 8.19 | BMS1 Theorem 14.1(i), §14, p.118, proof pp.118–119; BS Notation 18.1, Theorem 18.2 and Lemma 18.3, §18, p.122, proof pp.122–123. Corrected the previous range ending at the references page. |

Also checked TC §§3.3–3.8 (pp.30–32) against the stronger downstream spectral
range and the algebraic/spectral separation. The fixed public versions are
linked in the README: QH v2, QW v5, TC v4, GSWZ v2, BS v4, BMS1 v3,
Sch v1 and the 5 November 2011 DAG VIII. No library book or restricted source
was needed; the cleared-library index was read and no book content copied.

Read the reviewed HQ.1–HQ.8 library-coverage entries and checked both pins:
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Also audited current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`. No build was run in either
read-only current checkout.

Object/operation searches and declaration reads distinguish ordinary
`IsAdicComplete`, `DerivedCategory`, étale algebras and cyclotomic identities
from enhanced complete categories. Read the pinned `Algebra.Etale` and
`FormallyEtale` fields, `geom_sum_mul`, and the prime cyclotomic declarations.
Current Tau Ceti's `torusCharacter`, its add/neg/zsmul laws and the ordinary
Rees substrate remain cited. The Laurent automorphism application is additional
structure, not a duplicate general character theory. Current
AlgebraicVectorBundles L0B/L2B owns the ordinary bundle dictionary;
DGAInfinity and StablePeriodicCurved do not supply the specialized cyclotomic
complete descent or marked étale comparison. Their README and suggested-file
boundaries were checked. No new native-library duplicate was found or removed;
all already-cited native prerequisites remain citations.

## Validation and continuation boundary

- `lean-check research/blueprint/packages/HabiroCohomologyFoundations/Suggested.lean`:
  exit 0 at the required pins, exactly seven `declaration uses sorry` warnings,
  no other warnings or errors. All twelve examples are proved. Memory was
  checked before compiling; no language server or Lake build was started.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0, no offenders.
- `python3 scripts/check_blueprint.py` on the main packet and the four existing
  HQ.1-2, HQ.8, HQ.1 and HQ.3 split packets: all five report zero errors and
  zero warnings. These packets are unchanged; this is validity checking, not
  a claim that their older supplier aliases have been integrated.
- Four-file `intake.py check-files`, JSON parsing and `git diff --check`:
  passed. Final diff is confined to this issue's deliverables.
- Structural conservation and exact arithmetic controls passed: all old
  subsection identifiers, API bullets and Check blocks remain; m=1,2,6,12,
  the integral/characteristic-two overlaps, cubic modulo 5, Jackson values,
  coefficient relation and correction sign were computed independently of
  the admitted theorem proofs.

No confirmed Part I fix finding remains. Existing mathematical roadmap targets
remain targets: the full uncompleted framed comparison, conditional enhanced
multiplicative/base-change refinements, the analytic comparison, and the two
canonical specialization-map equalities are not advertised as proved. Their
named obligations and tests are retained. Family-wide packet/owner integration
follows the ownership moves above; it is not permission to edit those files in
this job. No suspicious embedded instruction was encountered or obeyed.

## Remaining supplier edges

Every row below is one subsection and its complete `This uses` contract in the
final README. HQ.1/HQ.2/HQ.4/HQ.3/HQ.5/HQ.6/HQ.8 are internal families
(Layers 1/2/3/4/5/6/8 respectively), as are Layer 0 and local § references.
Self-family labels abbreviate the preceding constructions and the explicit
dependency route in that subsection; they are not external circular imports.
The Scope and Exact supplier contracts additionally name E2 for enhanced
descent, CR.0 for ordinary PD foundations and AI.5 for canonical perfectoid
specialization. These are included in their scoped supplier contracts even
where a subsection imports them through its earlier internal layer.

Additional native prerequisites named in the opening contracts are the
polynomial/power-series and monoid-algebra carriers; Kähler universal
derivations; ordinary smoothness, finite projectivity and completeness;
`DividedPowerAlgebra.dp_mul`; ordinary derived and filtered/Rees substrates;
and current Tau Ceti's split-torus character laws. The upstream geometric
edge is AlgebraicVectorBundles L0B/L2B. QW.5 and QW.6:framings are internal
ownership aliases here; HR.6, HB.6/HB.7, HC, RT, Part II and CP's eventual
canonical-map application are consumers, not extra inputs. HS.3 occurs only
in the open analytic problem. No source-paper citation is treated as an
implementation supplied by a later package.

| Consumer subsection | Suppliers (internal and external) |
| --- | --- |
| 0.1 | DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E0 and E5:presentability. |
| 0.2 | §0.1, DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E0 and E5:presentability, QWittVectors QW.2. |
| 0.3 | §§0.1–0.2, QWittVectors QW.1/QW.3/QW.4, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.1 and EnhancedDerivedSheaves E0. |
| 1.1 | PrismaticCohomology PR.6, QWittVectors QW.1, Mathlib geom_sum_mul, Mathlib Polynomial.eval_geom_sum, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_pow_eq_geom_sum, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.prod_cyclotomic_eq_geom_sum. |
| 1.2 | HQ.1, AInfCohomology AI.1, Mathlib Algebra.Etale, Mathlib KaehlerDifferential. |
| 1.3 | HQ.1, PrismaticCohomology PR.6, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.3, DerivedDeRhamCohomology DD.4, CrystallineCohomology CR.2. |
| 1.4 | HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0, CrystallineCohomology CR.0, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.4, DerivedDeRhamCohomology DD.1. |
| 1.5 | HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0. |
| 1.6 | HQ.1, PrismaticCohomology PR.6, CrystallineCohomology CR.0. |
| 1.7 | HQ.1, CrystallineCohomology CR.0, PrismaticCohomology PR.6. |
| 1.8 | HQ.1, CrystallineCohomology CR.0, DerivedDeRhamCohomology DD.1. |
| 1.9 | AInfCohomology AI.1. |
| 1.10 | HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0, CrystallineCohomology CR.0. |
| 1.11 | HQ.1, PrismaticCohomology PR.6, CrystallineCohomology CR.2. |
| 1.12 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.4, EnhancedDerivedSheaves E5. |
| 1.13 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1. |
| 1.14 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1. |
| 1.15 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1. |
| 1.16 | HQ.1. |
| 1.17 | CrystallineCohomology CR.0, CrystallineCohomology CR.2, EnhancedDerivedSheaves E5. |
| 1.18 | HQ.1, EnhancedDerivedSheaves E5, PrismaticCohomology PR.6, CrystallineCohomology CR.2. |
| 1.19 | HQ.1, QWittVectors QW.1, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 1.20 | HQ.1, EnhancedDerivedSheaves E0. |
| 1.21 | HQ.1, EnhancedDerivedSheaves E2, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 1.22 | HQ.1, Mathlib Module.Projective. |
| 1.23 | Mathlib AddMonoidAlgebra, Mathlib AlgEquiv, HQ.1. |
| 1.24 | HQ.1, Mathlib LinearEquiv. |
| 1.25 | HQ.1. |
| 1.26 | the lattice action of §1.23, EnhancedDerivedSheaves E5:presentability and EnhancedDerivedSheaves E0/E1 coherent module-category limits. |
| 1.27 | the coherent action limit of §1.26, EnhancedDerivedSheaves E0/E1 affine modules and prestack right Kan extension, and EnhancedDerivedSheaves E5:presentability. |
| 1.28 | the quotient comparison of §1.27, EnhancedDerivedSheaves E0/E1, and AlgebraicVectorBundles L0B's affine finite-projective dictionary, with the specified lattice equivariance added here. |
| 2.1 | EnhancedDerivedSheaves E1, DerivedDeRhamCohomology DD.1. |
| 2.2 | HQ.2. |
| 2.3 | HQ.2. |
| 2.4 | HQ.1, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2, QWittVectors QW.1. |
| 2.5 | HQ.2, HQ.1, DerivedDeRhamCohomology DD.2. |
| 2.6 | HQ.2, HQ.1, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.2. |
| 2.7 | DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1, HQ.2. |
| 2.8 | HQ.2, HQ.1, DerivedDeRhamCohomology DD.1. |
| 2.9 | HQ.2, HQ.1, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 2.10 | HQ.2, HQ.1. |
| 2.11 | AInfCohomology AI.1, PrismaticCohomology PR.3, PrismaticCohomology PR.6, HQ.2, HQ.1. |
| 3.1 | QWittVectors QW.3/QW.4, QWittVectors QW.1. |
| 3.2 | HQ.4. |
| 3.3 | QWittVectors QW.3/QW.4, HQ.4, CrystallineCohomology CR.4. |
| 3.4 | HQ.4, QWittVectors QW.3/QW.4, DerivedDeRhamCohomology DD.2. |
| 3.5 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.6 | HQ.4, CrystallineCohomology CR.4. |
| 3.7 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.8 | Mathlib Algebra.Etale, DerivedDeRhamCohomology DD.2. |
| 3.9 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.10 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.11 | HQ.4, HQ.1, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.4. |
| 3.12 | HQ.4, DerivedDeRhamCohomology DD.4. |
| 3.13 | HQ.4, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.4. |
| 3.14 | HQ.4, QWittVectors QW.3/QW.4, EnhancedDerivedSheaves E5:animation, PrismaticCohomology PR.0. |
| 3.15 | HQ.1, HQ.2, §0.2, EnhancedDerivedSheaves E5:animation, PrismaticCohomology PR.6, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 3.16 | HQ.4, §0.2, §0.1. |
| 3.17 | HQ.4. |
| 3.18 | HQ.4, EnhancedDerivedSheaves E5:animation, EnhancedDerivedSheaves E5, DerivedDeRhamCohomology DD.2. |
| 3.19 | HQ.4, DerivedDeRhamCohomology DD.2. |
| 3.20 | HQ.4, EnhancedDerivedSheaves E5:animation. |
| 3.21 | HQ.4. |
| 3.22 | HQ.4, PrismaticCohomology PR.6, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 3.23 | HQ.4. |
| 3.24 | HQ.4. |
| 3.25 | HQ.4, DerivedDeRhamCohomology DD.2. |
| 3.26 | HQ.4, DerivedDeRhamCohomology DD.2, PrismaticCohomology PR.2. |
| 3.27 | HQ.4, HQ.2, PrismaticCohomology PR.3, PrismaticCohomology PR.2. |
| 3.28 | HQ.4, PrismaticCohomology PR.3, PerfectoidQuotients Q3. |
| 3.29 | HQ.4, HQ.2, HQ.1, PrismaticCohomology PR.3. |
| 3.30 | HQ.4, EnhancedDerivedSheaves E5. |
| 3.31 | §§0.2–0.3, QWittVectors QW.1, HQ.1 and AInfCohomology AI.1. |
| 4.1 | HQ.2, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1, HQ.1. |
| 4.2 | HQ.3, EnhancedDerivedSheaves E5:animation. |
| 4.3 | HQ.3, HQ.2, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.2. |
| 4.4 | HQ.3, HQ.2, DerivedDeRhamCohomology DD.2. |
| 4.5 | HQ.3, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 4.6 | HQ.3, HQ.2. |
| 4.7 | HQ.2. |
| 4.8 | HQ.3, HQ.4, HQ.1 and QWittVectors QW.1. The completed framed construction uses no rootwise Taylor comparison; its separate uncompleted comparison is the target of §3.31. |
| 4.9 | HQ.3, HQ.4, HQ.2. |
| 4.10 | HQ.3, HQ.4. |
| 4.11 | HQ.3, HQ.4. |
| 4.12 | HQ.3, HQ.4. |
| 4.13 | HQ.3, HQ.4, HQ.2. |
| 4.14 | HQ.3. |
| 4.15 | HQ.4, HQ.3, PrismaticCohomology PR.3. |
| 4.16 | HQ.3. |
| 4.17 | HQ.3, §0.1. |
| 4.18 | HQ.3, HQ.4, DerivedDeRhamCohomology DD.2, §0.1. |
| 4.19 | HQ.3, §0.1. |
| 4.20 | HQ.3, HQ.4, HQ.2. |
| 4.21 | §§0.1–0.3, HQ.2, HQ.3, HQ.4, QWittVectors QW.3/QW.4 and EnhancedDerivedSheaves E5. |
| 4.22 | HQ.2, HQ.3, AInfCohomology AI.1, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1. |
| 4.23 | HQ.3, HQ.4, HQ.1, EnhancedDerivedSheaves E5. |
| 4.24 | HQ.3, HQ.4. |
| 4.25 | Mathlib Module.Finite, Mathlib Module.Projective, HQ.3, HQ.2, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2, Mathlib CategoryTheory.preservesColimitIso. |
| 4.26 | HQ.3, HQ.4, DerivedDeRhamCohomology DD.1, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 4.27 | HQ.3, HQ.4, §0.1, DerivedDeRhamCohomology DD.1, Mathlib CategoryTheory.Limits.limit.post, Mathlib CategoryTheory.Limits.limMap, Mathlib CategoryTheory.Limits.limMap_π, Mathlib CategoryTheory.Limits.limit.post_π, Mathlib CategoryTheory.Limits.isIso_limMap, Mathlib CategoryTheory.preservesLimitIso. |
| 4.28 | Layer 0, HQ.2, HQ.3, HQ.4, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 5.1 | HQ.2, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E5:abstract. |
| 5.2 | HQ.5, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2, Mathlib Algebra.Smooth. |
| 5.3 | HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.4 | HQ.5, HQ.3, HQ.2. |
| 5.5 | HQ.5, HQ.1, PrismaticCohomology PR.6, EnhancedDerivedSheaves E5:presentability, HQ.2. |
| 5.6 | EnhancedDerivedSheaves E0, Mathlib Algebra.Smooth. |
| 5.7 | HQ.5, HQ.3. |
| 5.8 | HQ.5, HQ.3, Mathlib Algebra.Smooth. |
| 5.9 | HQ.5, EnhancedDerivedSheaves E5:abstract, Mathlib Algebra.Smooth. |
| 5.10 | HQ.5, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract. |
| 5.11 | HQ.5, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract. |
| 5.12 | HQ.5, EnhancedDerivedSheaves E5:abstract. |
| 5.13 | HQ.5, HQ.3, HQ.4, §0.1. |
| 5.14 | HQ.5, §0.1, HQ.4. |
| 5.15 | HQ.2, QWittVectors QW.1, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.0, Mathlib RingTheory.Sequence.IsRegular, Mathlib Algebra.Etale. |
| 5.16 | HQ.5, HQ.2, HQ.1, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.3, PrismaticCohomology PR.3, PrismaticCohomology PR.6. |
| 5.17 | HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.18 | HQ.5, HQ.2. |
| 5.19 | HQ.5, HQ.2, PrismaticCohomology PR.0. |
| 5.20 | HQ.5, PrismaticCohomology PR.0. |
| 5.21 | HQ.5, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.22 | HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.23 | HQ.5, DerivedDeRhamCohomology DD.0, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract. |
| 5.24 | HQ.5, HQ.3. |
| 5.25 | HQ.5, HQ.3 and §§0.3, 4.21 and 4.28. |
| 5.26 | HQ.5, HQ.3, HQ.2, HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.4. |
| 6.1 | HQ.5, AnalyticHabiroStack HS.3. |
| 6.2 | HQ.6, HQ.3, HQ.5, HQ.4. |
| 6.3 | HQ.6, §0.1 and AnalyticHabiroStack HS.3, only to formulate the open analytic comparison. |
| 7.1 | HQ.1, HQ.3, HQ.5, HQ.2. |
| 7.2 | HQ.1, HQ.3, HQ.4, Mathlib geom_sum_mul, Mathlib Polynomial.comp, Mathlib Polynomial.derivative_X_pow, Mathlib Polynomial.cyclotomic_prime. |
| 8.1 | HQ.1, HQ.2, HQ.3. |
| 8.2 | HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_mul_X_sub_one, Mathlib geom_sum_mul, Mathlib Polynomial.cyclotomic_three, Mathlib IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime, Mathlib PreTilt, Mathlib WittVector.teichmuller, Mathlib WittVector.fontaineTheta, Mathlib WittVector.fontaineTheta_teichmuller. |
| 8.3 | HQ.8, HQ.3, HQ.6. |
| 8.4 | HQ.8, HQ.1, PrismaticCohomology PR.6. |
| 8.5 | HQ.8, HQ.1, PrismaticCohomology PR.6. |
| 8.6 | HQ.8, HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.1, PrismaticCohomology PR.6, AInfCohomology AI.3. |
| 8.7 | HQ.8, HQ.2, HQ.3, AInfCohomology AI.1. |
| 8.8 | HQ.8, HQ.2, HQ.4, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 8.9 | HQ.8, HQ.2, HQ.4, AInfCohomology AI.1. |
| 8.10 | HQ.8, HQ.4, HQ.2, PrismaticCohomology PR.3. |
| 8.11 | HQ.8, HQ.3, HQ.4, CrystallineCohomology CR.4, Mathlib Polynomial.prod_cyclotomic_eq_X_pow_sub_one. |
| 8.12 | HQ.8, HQ.1, HQ.2, HQ.3, DerivedDeRhamCohomology DD.2. |
| 8.13 | HQ.8. |
| 8.14 | HQ.8, HQ.5, HQ.6, CohomologyComparisons CP.1, CohomologyComparisons CP.6. |
| 8.15 | HQ.4, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 8.16 | HQ.8. |
| 8.17 | HQ.8, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_mul_X_sub_one, Mathlib Polynomial.cyclotomic_three, Mathlib IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime, Mathlib WittVector.fontaineTheta_teichmuller. |
| 8.18 | HQ.8, HQ.1, DerivedDeRhamCohomology DD.1, AInfCohomology AI.4, CohomologyComparisons CP.1, CohomologyComparisons CP.6, PrismaticCohomology PR.6. |
| 8.19 | HQ.8, DerivedDeRhamCohomology DD.1, AInfCohomology AI.4, CrystallineCohomology CR.2, CrystallineCohomology CR.4, CohomologyComparisons CP.1, CohomologyComparisons CP.6, PrismaticCohomology PR.6. |
