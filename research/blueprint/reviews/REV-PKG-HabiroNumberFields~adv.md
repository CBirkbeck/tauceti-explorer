# Independent review: HabiroNumberFields

**Verdict: accepted after the corrections below.** The package is ready for a draft roadmap PR. This verdict concerns the specification, source fidelity, ownership and representative signatures; it does not assert proofs of the roadmap's proposed theorems.

Reviewer: `independent-review-REV-PKG-HabiroNumberFields~adv`, Codex (GPT-6), session `codex-gKDVRk`, 2026-10-19. Issue: #11070. The input came from PR #11049, commit `4532f8e5e`, authored in session `codex-FMv31p`; this is an independent review.

I read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md, the expansion protocol, UPSTREAM_GUIDE.md, the approved exemplar, the current ProfiniteArithmetic and LocalGaloisGroups roadmaps, the package, its author handoff, and all five accepted input packets. I checked the 94 packet targets against the 54 numbered README subsections and supplier boundaries. Definitions retain named APIs and at least three discriminating prose Checks; each layer has Examples and Dependencies. No target was dropped during this review.

## Corrections

1. Corrected the cyclic-chain citation from Hutchinson 2024 §2.2, pp. 3–4, to §2.1, Lemma 2.1 and Corollary 2.2, p. 2. Located the Bott construction and evaluation separately at §4, Lemma 4.1, p. 6, and the Chern conventions at §2.3, pp. 4–5.
2. Specified the positive even chain `α₂=Σ_j[t^j|t]`. At order three, normalization leaves two terms in each of α₂ and α₃; their boundaries are respectively `3[t]` and zero. The README now contains this explicit sign witness instead of asking for an unspecified even chain.
3. Corrected Wagner's numbering: 2.11 is a numbered item in §2.2, and 2.12 is a lemma in the same section, rather than two sections. Printed pp. 31–32 remain correct.
4. Added a primary locator for the numerical tame-kernel check for ℚ(i): Belabas–Gangl §7, p. 24, discriminant −4. The stated value is correct.

Suggested.lean and metadata.toml needed no changes. In particular, `Set.unit` really is Mathlib's S-unit type; the additional S-unit exactness declarations are supplied by Tau Ceti. I checked declaration bodies before retaining that attribution.

## Source audit

All locators below refer to the explicitly identified versions, with printed page numbers. I opened the original PDFs and read the relevant passages, rather than treating search snippets or the author's handoff as evidence. No source passage or source file is reproduced in the repository.

The author already marked substantive missing arguments: the Keune supplier translation, the finite-Chern sign diagram, uniform analytic limits, coherent root torsors, the half-shift defect calculation, and effective global descent. I inspected their cited passages; none was silently upgraded to a theorem proved by those passages. The functorial field and norm targets are expressly extensions, not attributed as printed GSWZ theorems.

The random sample used Python's `random.Random(11070).sample` on the 54 numbered subsection headings, selecting 15 distinct subsections before checking their sources:

| README subsection | Passage opened | Finding |
| --- | --- | --- |
| 2.4, arithmetic gluing | GSWZ v2 Definition 1.1 and (13), pp. 6–7 | Coefficient Frobenius and completed re-expansion have the stated direction. |
| 1.10, Chern sign | Hutchinson v4 Theorem 2.12, Corollary 2.13, p. 5; Lemma 4.1, p. 6; Proposition 4.6, p. 7 | The negative product and the positive tensor identification require the separate comparison already named in the roadmap. |
| 3.14, vanishing/constants | GSWZ Proposition 1.5(e),(f), p. 11, proof p. 45 | Full-series vanishing and the coprime-order integral constant assertion are distinguished correctly. |
| 2.5, local untwisting | GSWZ (331)–(333), p. 65 | The component exponent is positive in the untwist; the inverse reconstructs the twisted family. |
| 0.8, unit multiplicity | CGZ v3 Proposition 2.12, pp. 16–17 | The supplied equivariant Dirichlet argument is stated with actual infinite-place stabilizers; mod-p torsion is kept separately. |
| 1.7, eta | CGZ v3 (34), Lemma 5.1, p. 26; Theorem 7.4 proof, pp. 37–38 | Degenerate projective symbols and quadratic root scaling are retained. |
| 3.1, local sections | GSWZ Definition 1.3, p. 9; (195), p. 41 | The package explicitly corrects the unrestricted linear coefficient in the earlier display. |
| 3.2, Dwork | GSWZ Lemma 3.4 and Corollary 3.5, pp. 39–40 | The integral linear coefficient is an independent hypothesis. |
| 1.1, cyclic product | CGZ v3 §2.2, pp. 9–11, and §5.2, p. 28 | The integer-exponent product and its normalization differ from a fractional analytic root. |
| 3.18, determinant norms | GSWZ (21)–(22), p. 9 | These motivate the local defect condition; the norm theorem is clearly labeled additional and requires explicit trace/torsor compatibility. |
| 1.2, cyclic sum | GZ Appendix A, Proposition 8.1 and (56), pp. 235–236 | Numerator, denominator and shifted arguments agree. |
| 3.3, Pochhammer defect | GSWZ Lemma 2.1, Proposition 2.2, pp. 18–19; Theorem 10, p. 42 | The completion and possible simple pole are essential. |
| 1.14, calibration | CGZ v3 §5.3, pp. 28–30; Theorem 7.4, pp. 37–38; Hutchinson v4 §§3–4, pp. 5–7 | Numerical calibration depends on both an independently fixed Chern sign and the separately supplied eta-regulator value. |
| 1.11, local maps | CGZ v3 Lemmas 4.1 and 4.4, §§4.1–4.4, pp. 21–25 | Finite-coefficient rigidity, reduction and the norm-minus-one condition are present. |
| 3.8, global families | GSWZ Definition 1.4, p. 10 | Its condition is nonlinear; additive descent is a further target, as the package explicitly says. |

Additional source checks covered CGZ's universal Kummer sequence and descent (§2.2, pp. 9–13), order and field comparisons (pp. 14–15), ordinary units (§3, pp. 17–21), finite detection (pp. 22–28), and the published introductory statements (pp. 384–387). I read the complete eight-page Hutchinson v4 text and Hutchinson 2013 §§6.2–6.4, pp. 31–33, to check the cyclic/configuration comparison. I also checked GZ Appendix A, pp. 235–237; GSWZ's local construction, pp. 37–43, its Proposition 1.5 proof, p. 45, and classical Taylor comparison, pp. 59–66; and Wagner §2.2, item 2.11 and Lemma 2.12, pp. 31–32. Wagner's irreducibility shortcut is not used: the package requires the full finite étale algebra.

Sources opened:

- [CGZ v3](https://arxiv.org/pdf/1712.04887v3) and [published CGZ](https://math.uchicago.edu/~fcale/papers/CGZ.pdf).
- [GSWZ v2](https://arxiv.org/pdf/2412.04241v2).
- [Hutchinson v4](https://arxiv.org/pdf/2104.14413v4) and [Hutchinson 2013 v2](https://arxiv.org/pdf/1107.0264v2).
- [GZ, published Appendix A](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf).
- [Wagner's thesis](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf).
- [Belabas–Gangl](https://www.maths.dur.ac.uk/users/herbert.gangl/K2.pdf), §7, p. 24. Its quoted Keune sequences in §6.4, p. 22, were also inspected; that quotation does not replace the owner's required exact higher-order comparison.

## Existing mathematics and prerequisites

I searched by objects and operations across the current TauCetiRoadmap checkout, including Completed, and the current Tau Ceti library. The checked revisions were TauCetiRoadmap `0d144d044d`, Tau Ceti `a91d3aafa8`, with the package's Mathlib pin `082e2d37e8` and earlier Tau Ceti pin `f790474821`. I read the relevant declarations at the pins where cited and compared the additions in current Tau Ceti. No build was run in either read-only checkout.

| Existing interface inspected | Boundary retained in the package |
| --- | --- |
| Mathlib `IsPrimitiveRoot.autToPow`, `autToPow_spec` | Positive order requires `[NeZero n]`; the root character is consumed, not reconstructed. |
| Tau Ceti `powerClassQuotient`, `powerClassHom` | Power classes are classes in a quotient, not specially chosen representatives. |
| Pinned `kummerClassMap`, `kummerClassMap_injective`; current `kummerMap_surjective`, `kummerIso`, `kummerIsoTransport` | The pinned injection and current full isomorphism are distinguished; coefficient transport needs equivariance. |
| Mathlib `Set.unit` and ordinary Selmer injection; Tau Ceti S-unit `fromSUnitLift_injective`, `ker_toClassGroup`, `range_toClassGroup` | Existing exact sequences are suppliers. Right exactness has `[NeZero n]`; the arithmetic eigen-obstruction remains new. |
| Current `TauCeti.ContinuousCohomology.map_eq_id_of_inner` | The compatible-pair identity for locally compact groups and smooth discrete coefficients is supplied. The arithmetic scalar consequence and restriction argument remain here. |
| Current joint eigenspaces/Fourier decomposition | Projector hypotheses include invertible group order; they do not prove the integral prime-power lifting theorem. |
| Mathlib `PowerSeries.map`, `rescale`, substitution | Scalar coordinate changes use existing APIs; nonzero-constant re-expansion still needs convergence. |
| Mathlib `Pic.mk`, `mk_tensor`, `mk_eq_mk_iff`, `mk_eq_one_iff_free`, invertible modules | A Picard class is formed only after constructing a genuine invertible module and tensor maps. |
| LocalGaloisGroups and ProfiniteArithmetic | Existing roots, characters and local/profinite infrastructure are consumed. The arithmetic twisted Taylor construction is distinct. |
| AlgebraicVectorBundles | Its vector-bundle Chern classes do not supply the finite étale K-theory map. |

No duplicate target required removal in this review. The input already defers generic eigenspaces, Kummer theory, Selmer sequences, Picard formalism, cyclotomic completion, and local Galois theory. I found no `UPSTREAM:` placeholder or dependency on FoundationsAndLibraryIntegration. Supplier contracts identify the necessary Bloch conventions, finite-coefficient Bockstein, K-theory products/transfer, Tate coefficients, Keune quotient, Coleman presentation/trace, completion/chart and analytic inputs. The early finite-Chern prefix is explicitly required to be independent of the later regulator; the Nahm eta evaluation is only an input to a conditional refinement. Neither becomes a circular construction prerequisite.

## Adversarial pass

Each row covers all definitions, named API assertions and identities in the indicated subsection, including their standing hypotheses. “Retain” means the statement survived these instances as a roadmap target; it does not mean a proposed proof was supplied. “Obligation” marks an argument explicitly still to be proved in the build. Computations test conventions and find counterexamples; they do not replace general proofs.

| Statements / README location | Instances and calculation | Result / change |
| --- | --- | --- |
| Conventions and supplier contracts | n=0/1/2; Δ=1/2/6; p dividing Δ; full tensor product versus one factor; finite versus integral K-theory; 𝔽₂/𝔽₁₁ | Zero order is excluded where needed; order-one coefficient groups are trivial. At inverted p the adic completion is zero, unlike the rational tensor. Small-field Bloch comparisons have an explicit field-size bound. Retain. |
| 0.1, character equations and obstruction | Trivial G; n=9 regular module with twisted augmentation; χ versus χ⁻¹ at orders 5 and 7 | The augmentation image of eigenvectors is 3ℤ/9, not all of ℤ/9. No illicit averaging or invariant-representative requirement. Retain. |
| 0.2, excluded integers and good orders | ℚ: M=12, M′=4; ℚ(i): M=24, M′=8; n=1/3/9 and n=2M | Positivity, ramification and repeated-prime conditions remain distinct. Added the primary ℚ(i) tame-kernel locator. |
| 0.3, finite Chern map and root/order/field APIs | Weight one; weight two with k=−1; n=1; μ₃ already in F | Untwisting has weight χ^(1−r), and the order-one map is trivial. The map is defined even when G is trivial; K₃/n is not confused with all finite-coefficient K₃. Retain. |
| 0.4, scalar Sah consequence and injectivity | Trivial group; squarefree odd n, including 3; n=9 over ℚ | No scalar unit is obtained from the trivial-group test. Repeated primes have the w₂ condition; squarefree orders do not acquire that stronger hypothesis. Retain. |
| 0.5, finite endomorphism criterion and Keune obstruction | Zero A; n=0/1; all cyclic groups of size ≤40, all endomorphisms and 0≤n≤2 size satisfying the premise; A=ℚ/ℤ, f=3, n=3 | 37,066 finite cyclic instances passed. The divisible-group example fails without finiteness. The Keune quotient and its supplier proof remain explicit, rather than being replaced by Pic[n]. Retain. |
| 0.6, exact eigen-lift and valuation lattice | Injective equivariant lift; D=3ℤ in ℤ mod 3; n=9, p=3; unramified p=5 over ℚ(∛2) | The lattice inclusion can lose injectivity modulo n; the proof uses D/n itself. Cyclotomic degree/ramification uses unramifiedness, not Galois-closure disjointness. Retain. |
| 0.7, S-unit and ordinary-unit images | n=1; representative with a nonzero S-valuation; adjoining an n-th root | S is allowed to depend on n. Ordinary units and S-units are distinct, and coefficient-field extension is not asserted injective. Composite-order diagrams are named proof obligations. Retain. |
| 0.8, unit rank and mod-p dimension | ℚ at p=3/5/7; ℚ(√−7) at p=5; ℚ(∛2) at p=3; trivial character | The ζ₃ torsion class contributes one dimension; the trivial-character rank differs from an odd character. Infinite-place stabilizers give the correct rank without an extra closure-disjointness premise. Retain. |
| 0.9, finite Chern unit theorem | n=1/3/5/25/35 over ℚ; bad even orders | Squarefree surjectivity and general good-order injectivity are separate. The reduced M′ theorem has 9∤n. Retain. |
| 1.1, D, maps, polynomial realization, periodicity and phase | n=0/1/2/3; x=0 and ζ⁻¹; exact cyclotomic calculations through n=16; all shifts 0≤s≤n in four finite fields | Empty products equal one, vanishing factors remain allowed in the cleared identity, and D(1)^24=n^(12n). The cubic power class is not discarded. Retain. |
| 1.2, f, denominator/period/shift/diagonal APIs | n=0/1/2/3; x=y=0; singular denominators; rational (2,3,5) at order two | The rational value is 23/3. The total definition uses field division, while identities require nonzero factors. Shift tests passed on every eligible finite-field triple. Retain. |
| 1.3, KMS and analytic/integral descent milestones | (n,ℓ)=(3,19),(5,31),(7,43),(9,73); X=Y; characteristic dividing n; analytic center (1/5,2,−4/5) | All 6,354 admissible nonzero triples passed. At the analytic center the annulus and S=4/9 hold. Uniform tails, Gaussian scale/sign, phase and torsion-free algebraic descent remain named obligations. Retain. |
| 1.4, P and its boundary/root/inversion APIs | X=0/1/∞; trivial finite Kummer witness; all nondegenerate base-field X in seven quadratic finite fields | Lift changes and inversion passed. A finite witness cannot supply the universal Kummer isomorphism, and a single non-Bloch symbol has no unconditional descended value. Retain. |
| 1.5, R, five-term/order/field/root APIs and powered lift set | n=1/5/15/25; k=−1 and k=2 mod 5; μ₃⊂F; ξ=0 over ℚ(ζ₃) | The inverse-character root law passed finite tests. At noncoprime orders 1 and [2] can both lift the identity; the object is correctly a lift set with ambiguity. Retain. |
| 1.6, étale Bloch group and K₂ boundary | Ordinary Bloch classes; n=1; [32] over ℚ modulo five; fields containing μ_p | Dividing the exterior boundary of [32] gives {2,−31}, with a nontrivial tame value at 31. Ordinary-unit image cannot be extended to every étale class. Root-free and odd-convention hypotheses retained. |
| 1.7, eta and quadratic root scaling | n=3/5/7/9; ζ→ζ⁻¹; repeated vertices and projective endpoints | At n=3 the surviving [0] correction matters. Direct finite eta products agree with [ζ²], including a higher-valuation prime. Root-basis inversion and quadratic eta scaling are distinct. Retain. |
| 1.8, positive chains, Bockstein and Bott APIs | N=1…9 normalized boundaries; explicit two-term N=3 chains; B=ℤ[ζ_p] before inverting p | Boundaries are zero for α₃ and +N[t] for α₂. Bott may exist before étale coefficients do. Added the even-chain formula, sharpened the two-term Check and corrected both source locators. |
| 1.9, bar/configuration image and root-times-Bott | Repeated vertices; det A=ζ−ζ⁻¹; N odd; restriction degree two | The determinant correction yields an actual SL conjugation. Passing only to a Bloch quotient would lose K-theory information. Positive Bockstein and full configuration map remain required. Retain. |
| 1.10, signed Chern value and normalization comparison | Positive Kummer/Bott product; ζ→ζ⁻¹; c_raw versus c_plus | The negative product gives opposite values for the two independently defined maps. The c_fixed comparison is explicitly unresolved; neither eta nor squaring is used to conceal it. Retain as an obligation. |
| 1.11, local R and Chern maps | n=3, ℓ=5; ℓ≡1 mod p; representative with nonzero valuation | Unique n-th roots lie in the base residue field only in the stated norm-minus-one case. Reduction first needs unit representatives and finite-coefficient rigidity. Retain. |
| 1.12, eta generator and local isomorphism | n=3, ℓ=5 versus 17; exact and excess valuation; nonzero versus zero-weight factor | At ℓ=17, the order-three root class is not the generator test available at ℓ=5. The higher-order compatibility argument is explicitly required for the all-prime isomorphism. Retain. |
| 1.13, Chebotarev detection and comparison | Nontrivial cyclic Kummer extension; unit rescaling; failure of root-disjointness | Infinitely many reductions need a product, not a direct sum. Vanishing sets determine a cyclic subgroup, not its chosen generator. Field independence must check the compositum hypotheses. Retain. |
| 1.14, image and scalar calibration | n=5: (a,b)=(2,1),(2,−1); nonunit b; k² eta scaling | The two scalars are 2 and −2; a nonunit b cannot be inverted. The Nahm eta value and normalization comparison remain independent inputs. Retain. |
| 1.15, all-order ε, torsors and root lines | m=1/3/25; μ₃⊂K; representative u→uv^m; sign reversal | Torsors change by y→vy and do not select roots. All orders remain available through Chern classes. Equality of classes does not supply coherent equivariance; the latter is a named obligation. Retain. |
| 2.1, compatible roots and transition maps | m=1, coprime products, repeated p-powers; m=p^k m′ | The CRT exponent is p on the p-primary part and 1 on m′. Independent exp(2πi/m) choices would fail the coprime-product convention. Corrected Wagner's item numbering. |
| 2.2, full algebras and two Frobenius actions | K=ℚ(i), order four; p=11,m=5; p=2,m=3; split products | Coefficient and cyclotomic Frobenius are different. Full rank and coefficient permutations must survive splitting. No replacement by a single field factor. Retain. |
| 2.3, convergent re-expansion and ring/composition APIs | Polynomial q²; zero shift; nonzero root difference; incomplete coefficient target | Polynomial substitution agrees with the convergent formula. A nonzero constant shift requires completeness and topological nilpotence. Corrected the Wagner locator. |
| 2.4, arithmetic Taylor families and ring operations | Zero and one; p dividing Δ; constant i at p=3; iterated transitions | The Frobenius twist is substantive, and a zero completion contributes no condition. Constant coefficient families need not glue. Retain. |
| 2.5, local product and untwisting inverse | Order m=p^k m′ at k=0/1/2; K=ℚ(i), p=3 | The component untwist is φ_R^k; its inverse uses the negative exponent. Frobenius fixes the cyclotomic factor in this operation. Retain. |
| 2.6, p-chain and mixed-adic completion | m=1,p=2; constant/linear polynomials; p=11,m=5 split factors | Both the p-adic and cyclotomic directions are present; merely taking an x-adic completion misses the chain comparison. Retain. |
| 2.7, prime-to-p Taylor equivalence and all-order image | p=11,m=5 rank four; p=2,m=3 degree two; independent order-one/order-three seeds; zero and idempotent seed | All factors and independent chains survive reconstruction. The full chart, rather than an irreducibility assumption, is the supplier. Retain. |
| 2.8, coordinate change and weighted jets | m=1/2; k=0/1/2; bound N=4 | x=−ζu reverses the order-one linear sign. The strict inequality retains exactly five (m,k) pairs at N=4. Retain. |
| 2.9, rational classical comparison | Δ=1/2; odd-order indicator; KZ Taylor expansions at orders 1–4 | Direct finite polynomial computations reproduce all displayed coefficients. Completion after localization has idempotents that localization of the integral domain does not. Retain. |
| 2.10, components/idempotents/domain assertions | Δ=1/6; orders 5/35/10/18; K=ℚ(i), d=4 | Fixing the order component need not remove internal coefficient idempotents. The domain claim has the sufficient disjointness hypothesis. Retain. |
| 2.11, abelian scalar map and constants | ℚ; ℚ(ζ₅), m=2; ℚ(i), p=3; nonabelian ℚ(∛2) | The scalar image of ζ₅ at order two is ζ₅³. The inverse Artin action is forced by gluing. General fields receive no unjustified coefficient-ring algebra structure. Retain. |
| 3.1, corrected local sections and generated module | ξ=0; f=1, p, 0; (1+x)^(1/p); p=5 and 1+x/5 | The binomial has zero defect but fails the integral first jet. For 1+x/5 the logarithmic defect has x² coefficient 8/5. A module element need not be an invertible section. Retain. |
| 3.2, Dwork and exponential corollary | f=1; binomial above; unramified versus ramified coefficients; equal characteristic; p=2 | The linear premise is necessary. The exponential corollary retains p>2 and a small constant. Inverting p in equal characteristic is not an allowed coefficient model. Retain. |
| 3.3, p-depleted polylogs and Pochhammer defect | s=0/2/negative; coefficients of t and t^p; ζ=1 and p-power roots | The depleted coefficient at t^p is zero, and specialization needs 1−ζ a unit. A simple pole is permitted in the defect. Retain. |
| 3.4, regularized Pochhammer and presentation change | Empty presentation; even m; invalid raw symbol; relation between valid presentations | Formal half powers have constant one. A presentation relation supplies a unit ratio, not necessarily equal generators. Higher defect and presentation compatibility remain obligations. Retain. |
| 3.5, half-shift function, first jet and integrality | z=−1,r=±1; z=1 or r=0 excluded from its use; B₂(1/2)=−1/12; p=2/3/≥5 | The two Lean values are ±1/48. Derivation gives −z/(24r(1−z)); the first jet uses 1/ζ_m. Integral presentations and invertibility of 24 explain the good-prime scope. Retain. |
| 3.6, local rank-one freeness | ξ=0; ratio of two normalized sections; nonunit multiple and zero | Dwork requires both a first jet and defect estimate. Local generators give a free module locally, with no global generator inferred. Retain. |
| 3.7, extension to all orders | p≥5 with ω=2; p=2/3; zero phase; change of phase | 2−2⁻¹=3/2 is a unit only in the indicated scope. Phase normalization and its coherence remain part of the extension theorem. Retain. |
| 3.8, global subset and scalar closure | f=0; γ=1; γ divisible by m; sum f+g; degree-zero 1−q with γ=2 | Mixed terms prevent an automatic addition argument. The coefficient operation is localization, not reduction modulo γ; torsor composition is required. Retain. |
| 3.9, zero-degree ring and graded products | ξ=η=0; zero family; opposite degrees; orthogonal idempotents | Pointwise multiplication is compatible with degrees, but does not prove tensor bijectivity or recover p-divisible orders without the extension theorem. Retain. |
| 3.10, effective descent, finite presentation and conservativity | Degree zero; infinite intersections of rank-one lattices; a module supported on a proper idempotent component | Local rank alone does not prove finite presentation, addition or projectivity. The package explicitly asks for a linear descent theorem and identification of its equalizer with the nonlinear subset. Retain as an obligation. |
| 3.11, tensor equivalences and Picard character | η=0/−ξ; zeroth tensor power; finite sum mapping to 1; nontrivial invertible line | Tensor inversion does not choose a global basis. The map is to the existing Picard group after descent and requires coherent equivalences. Retain as an obligation. |
| 3.12, full-order substitution and involution | γ=−1/0/2; m=1/2/3; inversion of ζ+x; f=1−q | Inversion starts ζ⁻¹−ζ⁻²x. At m=2, squaring lowers the order, so it is not a root automorphism. γ=0 is excluded and no arbitrary divided K₃ degree is introduced. Retain. |
| 3.13, pairing and proportionality | f=g; g=0; orthogonal idempotents | With a=gτg and b=fτg, af=bg uses no division. The coefficients may vanish; no nonzero-proportionality assertion survives these tests. Retain. |
| 3.14, vanishing and integral constants | Full zero series versus zero constant; inverted-prime component; nontrivial root line | Propagation follows allowed edges only. Evaluation lands in the associated integral line at the stated coprime orders, not automatically in the base field. Retain. |
| 3.15, invertibility versus freeness | Multiplication by 0, 1 and 1−q in the integral rational ring; evaluation q=1 | Multiplication by 1−q is injective but not onto. An arbitrary section is not a basis. No universal abelian freeness assertion is made. Retain. |
| 3.16, field pullback and scalar equivalence | Identity; ℚ→ℚ(i) at split p=5; two-step tower; nonabelian coefficient field | Both local factors are retained. The tensor base is H_S over H_R, not S over R; membership/naturality precede the descent equivalence. Retain as an obligation. |
| 3.17, coefficient Galois action | Conjugation on ℚ(i); split local factors; σ changing ξ; σ²=1 | It fixes abstract ζ_m and q while moving coefficient factors and degree. It is distinct from q inversion. Retain. |
| 3.18, norm and defect/transfer diagrams | Split quadratic (1+ax,1+bx), including a=2,b=3; base scalar; ξ=0 | Whole-series norm has linear coefficient 5 and quadratic coefficient 6 in this example. Coefficientwise norm would give the wrong linear term. Trace, Frobenius and coherent torsor identities remain explicit obligations. Retain. |
| 3.19, multiplicative global norm | Identity and tower; 0/1; quadratic norm of 1+1; restriction of a base section | Norm(2)=4 while Norm(1)+Norm(1)=2. It is multiplicative, has the transferred degree, and does not assert a Picard norm without finite-flat Habiro base change. Retain as an obligation. |

The inapplicable degenerate tests are excluded by actual hypotheses, rather than assumed away after calculation: finite Chern orders are positive; arithmetic local-section primes satisfy p>3 and are unramified; the finite KMS identities permit positive characteristic prime to n; formal logarithmic half-shift expansions use characteristic zero; the KMS divided expression excludes its vanishing denominator locus. A field does not substitute for an unramified integer lattice in a statement requiring integrality. No noncompact group is fed to an argument requiring compactness. The inner-conjugation supplier has the stated locally compact/smooth-discrete hypotheses.

## Independent computations and Lean signatures

I wrote fresh scratch calculations rather than running code supplied by a source or adopting the original author's logs. Their retained mathematical results are:

- Exact polynomial arithmetic modulo Φ_n verified `D(1)^24=n^(12n)` for every n=1,…,16.
- Exhaustive finite-field KMS checks gave 108, 500, 1,372 and 4,374 admissible triples in the four fields listed above. Quasi-periodicity was also checked for every field element and every shift 0,…,n, including zeros; the shift equation was checked on all nonsingular hypersurface triples.
- Quadratic finite-field arithmetic used (n,ℓ)=(3,5),(3,17),(5,19),(7,13),(9,17),(15,29),(25,149). For every X in 𝔽_ℓ other than 0 and 1, all lift changes, inverse-character changes of primitive root and inversion were checked in the n-power quotient. There were 3, 15, 17, 11, 15, 27 and 147 such X respectively. The complete projective eta product, with its degenerate values, had class [ζ²] in each case. These are finite checks, not the proof supplying the unconditional Nahm calibration.
- Normalized inhomogeneous bar boundaries were computed at N=1,…,9. The added two-term order-three witness is included in the README.
- Exact rational calculation gave the coefficient 8/5 for the p=5 defect of 1+x/5. The Bernoulli polynomial value at 1/2 gave the half-shift sign and factor 24.
- Finite cyclotomic polynomial expansions of the KZ sum reproduced `1,−1,2,−5,15,−53,217` at order one; `3,11,72` at order two; and constants `5−ζ₃`, `8−3ζ₄` at orders three and four. At order m, the n-th product has at least floor(n/m) vanishing factors, so terms with n≥m(d+1) cannot affect a jet through degree d.
- Exhaustion of the finite cyclic endomorphism criterion gave the 37,066 instances above. The infinite counterexample and general Fitting argument were checked separately in prose.

I checked every one of the seven named Lean declaration signatures and all six proved examples against the README, including the surrounding variable blocks. This exceeds the ten-signature spot check requested by the review instructions:

| Lean declaration or examples | Hypothesis and generality check |
| --- | --- |
| `cyclicDilog` and two examples | Arbitrary commutative ring, total at n=0; order-two and asymmetric order-three orientations agree. |
| `cyclicDilog_quasiPeriodicity` | Field, positive n, primitive root, s≤n; no unnecessary nonvanishing assumption on x. |
| `cyclicDilog_one_pow_twentyFour` | Positive invertible n and primitive root; all orders, not just odd ones. |
| `cyclicHypergeom` and two examples | Arbitrary field, total division; the n=2 rational example is not incorrectly presented as an admissible KMS triple. |
| `cyclicHypergeom_shift` | Positive n, primitive root, both X and Y nonsingular, and the exact hypersurface relation. |
| `kms_odd` | General field, n≥3 odd, n nonzero in the field, all x,y,z nonzero, X,Y≠1 and X≠Y; shifted factors and exponent match the cleared README formula. |
| `halfShiftLinearCoeff` and two examples | Characteristic-zero field; real rational-function body and proved values ±1/48. Use as a section coefficient retains r≠0 and z≠1 in the README. |

`lean-check research/blueprint/packages/HabiroNumberFields/Suggested.lean` exited **0** against the shared pinned build. Its only warnings were the four intended `sorry` theorem warnings; all six examples are proved. Suggested.lean is unchanged from that successful run. It has 137 lines, a single `import Mathlib`, no sorry-defined carrier, no admitted example and no ad hoc construction chain. The heavy definitions and milestones stay in the README and are identified in the closing comment. Their prose Checks were not replaced by weakened numerical Lean substitutes.

## Handoff and validation

There is no unfinished review correction. The next stage can prepare the draft roadmap from this package. It must preserve the explicitly unresolved mathematics: the early finite-Chern supplier prefix and Keune comparison, the signed normalization diagram, KMS uniform analytic limits, coherent all-order Chern torsors, the higher half-shift defect and presentation independence, effective global descent, and the naturality/transfer diagrams used by the final functorial targets. In particular the review does not certify global projectivity merely from local rank one, nor does it identify c_fixed with a chosen sign without its diagram.

The packet inputs, atlas data, reader documents and source files were not modified. The topic remains `math.NT`. This report carries the handoff within the issue's allowed paths. No suspicious instruction was encountered in the external data read for the job.

Validation completed:

| Check | Result |
| --- | --- |
| `lean-check` on Suggested.lean | Exit 0; only the four intended `sorry` warnings. |
| `intake.py check-files` on the five permitted deliverables | 5 files, 0 problems. |
| `scripts/check_blueprint.py` on HabiroNumberFields and supplements HB.1, HB.2, HB.6, HB.7 | All five exited 0, each with 0 errors and 0 warnings. |
| README structure and sample reproducibility | 54 numbered subsections, each with at least three Checks; seed 11070 reproduces the source sample. |
| `git diff --check` | Clean. |
