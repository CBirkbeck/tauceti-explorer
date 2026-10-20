# K2SymbolsBrauerPartII package handoff

Issue: #11365, `PKG-K2SymbolsBrauerPartII~codex`. Agent: Codex, session
`codex-FbTgoX`. Branch: `codex-FbTgoX-k2-symbols-brauer-part-ii`. Date:
2026-10-20. The claim bot confirmed the claim in
[comment 6289821033](https://github.com/CBirkbeck/tauceti-explorer/issues/11365#issuecomment-6289821033).
The higher-priority issues #9222 and #9215 were unavailable. This run took one
issue and will take no second issue.

## Completion and scope conservation

The package is complete for independent package review, not an implementation
or a mathematical-closure claim. Its three package files and this handoff are
the only changed paths. The README has five layers and 23 mathematical
subsections, corresponding in order to all 23 input targets. All 62 input API
names occur in it. All 94 input Checks are retained mathematically; six further
Checks make coefficient, naturality and boundary cases explicit. Every
subsection has at least three Checks, a proof/construction route, source
locators and dependencies. Each layer has worked examples and dependencies.
The README is approximately 86 KB, within the issue's 50–200 KB requirement.

There is no omitted README target and no unresolved source locator needed for
the specified comparisons. Missing implementations are named supplier or
roadmap targets, not assumed library declarations. The broad norm residue
theorem, Moore kernel theorem, new arithmetic reciprocity proofs, and Tate's
thesis are outside this package. Nothing in their proofs is claimed completed.

The Lean companion has one real-bodied total conic definition, three admitted
headline theorem signatures, and two proved examples. The norm criterion has
unit inputs and characteristic different from two; the real theorem has
arbitrary real inputs and weak inequalities; the rational nonmultiplicativity
theorem is stated with its exact three coefficients. These scopes agree with
README §3.3. Classical K₂, all-weight Tate coefficient/cohomology, symbol
algebra and finite K-spectrum carriers are absent at the pins, so their
milestones remain README targets and are named in one closing Lean comment.
No weakened carrier, abstract input record, admitted data, algorithm, or
auxiliary theory was introduced to force those statements into Lean.

The requested cubic, root-change, residue, crossed-product, Bockstein and
Chern witnesses are explicit README Checks. They cannot also be proved Lean
examples on the absent carriers. The binding headline/carrier and proved-only
example rules take precedence over the older blanket instruction to mirror
every Check as an example. The two retained Lean examples test this package's
own total conic definition, including zero coefficients. They use no `sorry`.

## Dependency order and supplier resolution

The package follows **K2SymbolsBrauer Layers 1–13** and
**MotivicEtaleKTheory**. Neither supplier may use a Part II comparison to
construct its own input. The exact named contracts are in the README; no
`FoundationsAndLibraryIntegration`, `UPSTREAM:` or phantom `AlgebraicKTheory`
reference survives. K2SymbolsBrauerPartII is outside the Caraiani–Newton tier
list; its issue's explicit ordering governs. No upward supplier was added and
no notion had to move down from a higher-tier roadmap.

The fourteen packet requests are resolved as follows:

| Input requests | Contract used by the package |
| --- | --- |
| ClassFieldTheory Layers 5, 6, 10, 14 | Existing local coefficient/invariant maps, arithmetic Artin evaluation, number-field Brauer sum and quadratic all-place law. The current invariant coordinate is imported, not reconstructed. |
| QuadraticFormInvariants §§6C, 6E, 7B | Existing norm-equation Hilbert symbol and local formulas, cohomological Hilbert comparison, generic Brauer equivalence and crossed-product/quaternion conventions. |
| ClassicalArithmeticCompletion CA.1 | §§1.14, 1.25, 1.52, including the explicit general nonarchimedean local scope, mixed-characteristic wild coefficients, and number-field degree-m product law. |
| MotivicEtaleKTheory M.1, M.2 | §§1.1–1.6 and 2.5, with the actual finite/adic coefficient, localization and real-place maps. |
| MotivicEtaleKTheory M.3 extension | The current package §3.4 explicitly retains global function fields and names their reciprocity and finite tame-kernel extension targets. §3.5 supplies the ring map and finite reductions, including real places at 2. No number-field theorem is silently generalized. |
| GeneralAlgebraicKTheory K.7 interface | Its spectrum/cofiber exactness and integral products, together with the finite coefficient cofiber already required by MotivicEtaleKTheory §12.1. README §5.4 derives the exact degree-two segment and identifies its integral-reduction image. It does not claim a separate finite coefficient object was already named in general K-theory Layer 7. |
| MotivicEtaleKTheory legacy M.8 extension | The concrete finite Chern owner is current §12.1, `finiteEtaleChern`. Isolate the low-degree universal-class branch: coefficient cofiber, integral reduction, Kummer in degree one and Soulé's integral-product formula. Factorization through finite reduction is checked in Soulé §2.2.3.2. This branch uses coefficient theory and general K-products, without regulators, this Part II, or a late readiness checkpoint. |
| K2SymbolsBrauer product-sign import | Current §§8.1–8.3 supplies the fixed raw Hurewicz map, computed ε=-1 and product-normalized θ₂♮. The older packet's free ε is not substituted for this newer fixed computation. |

For maintainer routing, preserve the previously decided move of the former
base Layer 14 into this Part II. The opening ownership paragraph and late
readiness/consumer references in older supplier material still need that
owner-level retargeting where applicable. This job does not edit those files.
In particular the broad dependencies of MotivicEtaleKTheory Layer 12 do not
become prerequisites of its isolated degree-two universal Chern construction.
The supplier's finite-by-finite product range is never enlarged: reduction of
an **integral** product is enough, including at m=2 and m=4.

## Duplication and carrier audit

Read the reviewed K2SymbolsBrauer T.7 library audit, then searched by objects
and operations in the pinned Mathlib, current Tau Ceti and current upstream
roadmaps, including the nine roadmaps absent from the atlas snapshot and the
Completed roadmaps. The read-only roadmap checkout was
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command ran there.
LocalFieldsRamification and QuadraticFormInvariants, current LocalGaloisGroups
and IntegralLattices, and the named exemplar were read for form and boundaries.

The following objects are imports, removed from any interpretation as new
construction targets:

- Mathlib `rootsOfUnity`, `IsPrimitiveRoot.zmodEquivZPowers`,
  `IsPrimitiveRoot.zpowers_eq`, tensor products, units, finite free modules,
  matrices, quotient groups and scalar-extension algebras. Their actual
  primitive-root statements were read at the pin.
- Native `TauCeti.KummerCoeff`, `kummerMap`,
  `kummerMap_eq_kummerCocycleClass`, `ker_kummerMap`,
  `kummerMap_eq_one_iff`, and continuous `explicitCup11` with its negative-flip
  theorem. The dictionary uses these maps; it does not reconstruct Kummer or
  cup products.
- Current `ClassFieldTheory.h2MuEquivZMod` and
  `toRatAddCircle_h2MuEquivZMod` in
  `NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean`, and
  `kummerCupPairing` in `ClassFieldTheory/Local/Symbol.lean`. Only its tensor
  factorization is new.
- Current `brauerCohomologyEquiv`, its crossed-product characterization, and
  `brauerCohomologyEquiv_quaternionClass` in
  `Algebra/CrossedProduct/{Comparison,CupProduct}.lean`. Only the particular
  arbitrary-degree symbol-algebra representative is constructed here.
- Current generic `TauCeti.hilbertSymbol` in
  `NumberTheory/HilbertSymbol/Basic.lean`, its norm criterion, real/dyadic
  formulas and local bilinearity, and `hilbertSymbol_eq_cohomological` in
  `FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean`. The total conic helper
  differs by allowing zero inputs. The K₂ factorizations differ by their
  classical K₂ domain.
- The existing Matsumoto/Galois-symbol, Tate, ring, and finite Chern theorems
  in the named suppliers. This package transports actual maps, not abstract
  isomorphism types, and does not re-plan those theorems.

The searches did not find another owner of the kept arbitrary-degree corner,
the signed K₂ adapters, or the total conic definition. Supplementary open
Mathlib PR and public Zulip archive searches for Milnor K-theory, K-theory and
Hilbert/conic symbols revealed no additional matching carrier to consume;
this is a limited search result, not a claim that no related work exists.

## Adversarial mathematics pass

The rows below cover all target statements and their named API identities,
including constructors and uniqueness/naturality assertions. Inputs that make
a theorem ill-typed, rather than false, are recorded as domain exclusions.
The all-weight, wild, real and composite cases remain in the general targets.

| Statements checked | Instances and calculation | Result and correction or retained guard |
| --- | --- | --- |
| Standing coefficient, tensor and quotient conventions | m=0,1,2; characteristic p with p dividing m; zero module at m=1; Q with m=3 | Exclude m=0; field invertibility excludes p-divisibility only where needed. μ₃ has cyclotomic action while its square has trivial action. A/m, A[m], and spectrum coefficients remain distinct. |
| §1.1 ordered cup dictionary | Power slot and Steinberg pair give zero; Q,m=3 has no scalar root coordinate; R,m=2 has nonzero Hamilton cup | Native additive/type-tag and tensor pairings retained. No root hypothesis on the tensor symbol, and no general-field isomorphism required. |
| §1.2 rootTwistTrivialization and its basis, zero, weight-one and tensor APIs | m=1; weights 0,1,2,-1; m=5,ζ→ζ² gives 1,2,4,3 in these weights; 2·3=1 | Tensor/dual coherence and evaluation fixed. Negative exponents are taken in the unit group. Weight zero is identity, not a chosen scalar. |
| §1.3 rootCupContraction, pure tensors, pairing comparison and uniqueness | m=5: ζ²⊗ζ³ maps to ζ, but root multiplication gives 1; additive zero root 1 maps to 1; root change gives ζ³ | Tensor factorization uses bilinearity and pure-tensor generation. Contraction changes by 3, inverse weight-two coordinate by 4. Added the explicit contraction root-change Check. |
| §1.4 brauerSymbol, symbol value, torsion, algebraic export and uniqueness | m=1 zero; power and Steinberg slots zero; R,m=2 Hamilton invariant 1/2, positive slot split | Field Picard vanishing justifies the Kummer identification; no scheme analogue is inferred. Existing quaternion comparison imported. Generation gives uniqueness. |
| §1.5 root-change and restriction maps | m=5,u=2: β changes by 3; m=3 inversion negates β; identity and two composed embeddings | Fixed root transport, not new root choices. Verified u times u inverse cancels only after exponentiation; three different coordinate scalars are retained. |
| §1.6 residue and unramified-unit APIs | Q₇,m=3,{3,7}: κ(3) has order 3 and differs from its negative; two units give zero residue; Q₂,m=2 is wild | Uniformizer-last tame value and negative cohomological boundary retained. Residue requires invertibility in the residue field; field invertibility alone is insufficient. |
| §2.1 algebra, basis, relations, lift and scalar extension | Multiply YX and XY; dimensions at m=2 and m=4; a=c^m; root-preserving identity/composition | Carry exponent jk gives YX=ζXY. Normal ordering and the m² basis prove the lift property. m=1 only the separate F convention; no invalid Fin 1 index. |
| §2.2 splitting representation and central simplicity | Forward shift with b at wrap, including last index; m distinct nonzero eigenvalues; a=1 and b nonsquare; Hamilton over R vs C | Both relations checked, all interpolation denominators nonzero. No root of b required. Descent uses a genuine separable splitting extension. General noncentral u^m=1 is insufficient; a matrix-over-division-quaternion counterexample is recorded. |
| §2.3 proper-degree corner | d=1,m; m=4,a=c²,c nonsquare,d=2; dimensions 16=4·4; factors T²-c and T²+c | Proved d divides m and α^d lies in F from the Galois subgroup. Orthogonal idempotents and Y^s give the actual degree-d corner; irreducibility of T^m-a never assumed. |
| §2.4 algebra/cup equality and quaternion specialization | Carry cocycle d, cochain γ^i, δf=d·ζ^(j(g)i(h)); proper degree i=s·i_d; Q₇ cubic invariant 1/3 | Negative flipped cup gives positive ordered cup. Used the fixed generic crossed-product equivalence. Opposite algebra detected by the cubic value; m=2 specializes to existing QFI. |
| §3.1 normResidueK2, uniqueness, quotient and power APIs | m=1; Q₂{-1,-1}=-1 with tame value 1; Q₃{3,-1}=-1; odd quadratic tame character | Matsumoto factors the supplied all-local-field pairing. Wild coefficients retained; no tame-only definition. Exponent m gives quotient factorization and power relations. |
| §3.2 split surjectivity and section | Q₂ full μ₂ section; m=6 nonidentity ζ² has order 3; relation t^m=ζ^e implies t^(m²)=1 | Full root hypothesis forces the power class of ζ to have exact order m. Perfectness gives a primitive value, then adjusts it to ζ. Section order proved both ways; no conclusion about the Moore kernel. |
| §3.3 total conic and every elementary API | (0,0) over R gives -1; (1,s) and (r,1-r) give 1 over every field; norm proof cases v=0 and x=0; Q coefficients 3,7,21 | Weak real inequalities retained. Division only with nonzero coordinates; exceptional split forms use 2≠0. Primitive integer descent modulo 3 or 7 proves all three rational signs -1, so the bilinear law is not global. Lean signatures preserve exactly these domains. |
| §3.4 local/real hilbertK2, conic comparison, norm comparison and uniqueness | Q₂ Hamilton; R negative vs positive slots; no unit at zero; Steinberg pair | Existing Hilbert object consumed, new K₂ homomorphisms only. Nonarchimedean and real constructions separate. Norm-kernel identification determines a two-valued symbol here, not a higher-order scalar. |
| §3.5 invariant sign, flip and coordinate | Q₇,α³=3, arithmetic Frobenius ratio reduces to 2 and equals ζ; A(3,7) invariant 1/3, H(7,3)=ζ, H(3,7)=ζ inverse; m=1,2 | Root is not identified with the integer 2 in Q₇. Artin-first convention requires the negative exponent. e_m([1/m])=1, whereas multiplication by m in Q/Z gives zero. Root-change invariance checked. |
| §4.1 finite, real, complex and symbol factors | Q,m=1 all values 1; Q,m=2 at 2 and infinity both -1; m>2 no real embedding; root round trip | Common global μ_m target retained. Real sign inserted only at m=2; complex factor 1. Actual completion map and inverse root transport used. |
| §4.2 finite support and equality with invariant support | Hamilton support exactly {2,infinity}; m=1 empty; x+(-x) has empty support | All archimedean and coefficient primes allowed in support bound. Sum support is a subset of a union, not generally equal. Support independent of symbol presentation because each local map is already on K₂. |
| §4.3 product, sum and their equivalence | Hamilton product (-1)(-1)=1, invariants 1/2+1/2=0; m=1; sum of two symbols | Finite support legitimizes products/sums. Injectivity of global root coordinates proves equivalence. Actual scalar and Brauer laws imported; theorem quantified on all K₂. |
| §5.1 local Tate and residue dictionaries | Q₇ cubic; Q₂ wild dyadic; R at every 2-power, C; F₂((t)) at ℓ=3 vs excluded ℓ=2 | General local theorem includes archimedean cases. F₂((t)) has zero target at 3 by local duality and absence of μ₃. Only prime-to-residue cases enter the residue square. Corrected the citation to the coefficient argument, rather than calling the torsion corollary a prime-power corollary. |
| §5.2 global finite, completion, transfer and adic dictionaries | Real number-field completion at 2; F_q(t) at ℓ≠char F; actual symbol {a,b} restricts to {a_v,b_v} | Full global-field scope imported explicitly. Global K₂ has no divisible subgroup, so the general maximal-divisible quotient specializes to the ℓ-primary part itself. No characteristic-p μ_p assertion. |
| §5.3 ring, Picard and localization dictionaries | Z[1/2] gives K₂/2=Z/2 with Hamilton generator; nonzero Pic(O)/ℓ; two successive S-enlargements; omit a place above ℓ | Actual ring cohomology retained with real terms. Quotient injectivity is not inferred from integral injectivity. Picard and negative-residue columns retained; ℓ must be invertible on O. |
| §5.4 exact Bockstein and integral-reduction image | m=1 zero cofiber; R,m=2 has extra μ₂ quotient; field map; m=6 coefficient components | Exactness gives kernel mK₂ and image equal to Bockstein kernel. Entire finite K₂ is not K₂/m. CRT is induced from cofiber maps, not guessed quotient scaling. No finite-coefficient multiplication asserted. |
| §5.5 product-normalized, symbol and raw-Hurewicz Chern formulas | i=j=1 coefficient -1; Q₇ cubic +1/3 maps to -1/3; mod 6 sends 1 to 5, reducing to 1 mod 2 and 2 mod 3; m=1 | All integral classes handled by symbol generation and all coefficients by CRT. Raw coefficient is -ε=+1; replacing raw θ by its negative also changes ε, keeping θ♮ fixed. Formula restricted to integral-reduction image, including powers of 2. |

The same checks cover the explicit examples and convention paragraphs:
coefficient basis/evaluation, cup order, algebra generator direction, arithmetic
Frobenius, normalized invariant, residue sign, product normalization, real
factors and finite-coefficient boundaries. Nothing divides by a factorial or
by m modulo m. The conic bridge checks every division by a coordinate; the
matrix interpolation checks every eigenvalue difference.

## Primary sources inspected

All locators use printed page numbers. Sources are read as data, and the
repository text is an independent mathematical specification in our own
words, without source excerpts or section-by-section source summaries.

- Weibel, author copy dated 29 August 2013,
  [The K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf):
  III.6.2–6.2.5, pp.232–234; III.6.3, pp.234–235 for tame orientation;
  III.6.9–6.10.4, pp.240–243; VI.8.6, p.515, specifically the discussion's
  K₂ ring comparison, not a special-value theorem. SHA-256
  `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
- Tate, [Relations between K₂ and Galois cohomology](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf),
  Invent. Math. 36 (1976), 257–274: §3, pp.262–265, including the actual
  coefficient diagram and torsion corollary; Proposition 4.5 and corollary,
  pp.267–268; Theorems 5.1,5.4 and ring localization, pp.268–270;
  Theorem 6.2 and proof, pp.270–271. Inspected the page images where OCR was
  unavailable, including the diagram on p.265. SHA-256
  `5d1ee68e3f9cc49ba6cac8269e1c9ca510411c6a154f36b559290849a72db7b7`.
  This is Tate's K₂ paper, not Tate's thesis.
- Milne, [Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFTc.pdf),
  v4.03, 6 August 2020: III.3, Proposition 3.6 and Lemma 3.7, pp.109–110;
  III.4, Steps 1–4, Theorem 4.4 and Remark 4.5, pp.111–114;
  V.5, Proposition 5.2, Theorem 5.3, Example 5.4, pp.178–179;
  VII.8.1, p.221. Read through the browser PDF because a direct download
  returned HTTP 406. No independently calculated file hash is claimed.
- Soulé, [Groupes arithmétiques et K-théorie des anneaux d'entiers de corps de nombres](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf),
  June 1978 thesis, author's transcription: Proposition 2.2.2.3 and proof,
  pp.42–44; §§2.2.3.1–2.2.3.3, pp.45–49; §2.2.4.4, pp.53–55.
  Verified the finite factorization and boundary maps, the warning about
  finite-by-finite products, and the explicit negative degree-two formula.
  SHA-256 `19bb0877616c262fcb83c9fe6ad88f98747f117f23805b6154e19174dbb659a7`.

The previous design's four source cautions were checked again: Weibel
III.Lemma 6.9.1 needs the full minimal polynomial (Mat₂(D) with a nonsplit
quaternion D over Q₅ and diag(1,-1) disproves the stated unrestricted
degree-four version); Weibel III.Example 6.2.3 needs a primitive pairing value;
Tate p.265 prints H¹ in the Lemma 4.1 diagram where its defined h₁ has H²
target; and Soulé's hosted transcription p.49 prints (1-i)! instead of the
(i-1)! from Proposition 2.2.2.3. The latter typo was checked on the rendered
page and does not affect i=1. We do not assert comparison with other editions
or with a source correction list not inspected. Milne's alternative algebra
relation XY=ζYX is converted rather than copied into the YX convention.

The cleared-library index was read. No Gille–Szamuely book copy was used;
none was cleared for this job. No restricted book file or passage was copied.
No suspicious external instruction was encountered or followed.

## Verification and next action

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauerPartII.json`:
  exit 0, zero errors and warnings. The checker reports its
  definition/construction subset as 42 API items and 36 tests; direct counts
  over all 23 nodes give 62 and 94. The input packet was not changed.
- Direct conservation check: all 23 targets mapped to consecutive README
  subsections, all 62 API names found, all 94 Check statements compared by
  meaning, 100 final Check bullets. Definition/construction API and negative
  controls retained. No process identifiers or private paths in package files.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/K2SymbolsBrauerPartII/Suggested.lean`:
  exit 0; no admitted data. One real definition, three admitted theorems,
  two proved examples, no options or additional imports.
- `lean-check research/blueprint/packages/K2SymbolsBrauerPartII/Suggested.lean`:
  exit 0 at pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`
  and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Only the
  three expected declaration-uses-sorry warnings. Available memory was
  79 GB before compilation. No language server, build, update or cache fetch.
- `python3 research/blueprint/intake.py check-files` on all four deliverables:
  exit 0, four files and zero problems. The final staged diff also passes
  `git diff --cached --check`.

Nothing remains for another package worker. The next action is independent
package review, with the supplier routing above preserved; no separate review
claim or verdict is made by this author. The PR URL is recorded in the
external worker marker when opened. Scratch copies and logs are deleted after
submission; source locators, versions, decisions and verification results needed
for review are preserved here.
