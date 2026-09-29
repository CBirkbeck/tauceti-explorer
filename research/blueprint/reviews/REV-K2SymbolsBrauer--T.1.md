# Independent review of K2SymbolsBrauer T.1–T.2

Job `REV-K2SymbolsBrauer--T.1`, issue #438. Codex, session `codex-5ebb6f`, 2026-09-29. Original author: Claude Code, session `cc-7b31c4`, BP-K2SymbolsBrauer--T.1 / PR #2781. This reviewer did not write that packet.

**Verdict: needs_changes.** The review is complete. The blueprint remains partial; a source citation or a passing schema checker does not establish closure.

Reviewed all 28 original nodes and all 23 original baseline declarations against their actual pinned statements. Added 17 nodes, for 45 total; ledger counts: {"added": 17, "corrected": 23, "unverifiable": 5}. The revised packet has 80 API items, 52 construction/definition tests, 26 baseline citations, 7 supplier requests and 23 explicit gaps. All six coverage records are partial. No implementation is claimed.

The source inspected is [Weibel's author copy](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), dated 29 August 2013, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. Locators below use PDF page numbers, eight higher than the printed continuous page numbers. The download matches the original packet's hash. Reviewed III.5.1–5.5.2, III.5.10–5.10.5, III.6.1–6.1.3, III.7.1–7.2, the cited plus exercises, IV.1.7.1/1.10.1 and VI.4.3.2/5.2.1/5.3; this does not claim to have read the entire book. Milnor's normal-form proof, Bass–Tate and Dennis–Stein originals were not obtained.

## Corrections that affect the mathematics

- The integral degree-three map is injective for every field, as VI.4.3.2 explicitly states. The packet incorrectly claimed noninjectivity. For Q its source is Z/2 and target Z/48 (VI.5.2.1), so surjectivity fails. The rank of Quillen K3 over a number field is controlled by complex places; real places alone do not imply positive rank.
- A square root of -1 does not make repeated-entry Milnor symbols vanish integrally. In C(t), the t-adic residue of {t,t}={t,-1} is -1. Characteristic two does give the relevant vanishing; containing a square root of -1 suffices after reduction modulo two. The author copy III.6.3 (PDF p.242) uses the inverse tame-residue convention to this roadmap. Both send this particular symbol to -1; no general residue comparison is asserted here.
- Algebraically closed unique divisibility needs degree at least two. C× has roots of unity; degree zero is Z. The real direct-sum statement needs positive degree. The author-copy omissions are recorded under sourceIssues, with edition and access limitations.
- A free quotient need not have zero relation-module kernel S/[S,F]. Killing a redundant generator in Free(a,b)->Z gives a nonzero class detected by its exponent sum. The Hopf intersection kernel and the larger relation kernel are different objects.
- Opposite-root commutators are intentionally unprescribed by the three displayed Steinberg relations. They occur at higher rank too; the cases are not exhaustive. Tests now distinguish reverse product order over a noncommutative ring.
- Finite splitting over St_n does not itself establish centrality of St_n->E_n. Removed that deduction, retained n>=5 splitting, and supplied a precise conditional centrality lemma under injectivity on the unstable kernel. Source issue E2 records this as a missing proof input, not a claimed ring counterexample.

## Baseline and ownership audit

The Mathlib and Tau Ceti pins are those in the packet. All 23 original names exist, including `Matrix.diag2_decompose` (it is in namespace Matrix, outside the closed SpecialLinearGroup namespace). No existing name was removed. Corrected eleven `provides` contracts: commutative-ring scope of elementary matrices, forward-only scope of the single commutator lemma, fixed-action/normalized-section scope of factor-set classification, representation coefficients in H1/H2/groupHomology, type-indexed HomotopyGroup, lack of grading in RingQuot, type-level DirectLimit, and ZMod versus cyclicity of a finite field's units. Added the three separately inspected Tau Ceti additivity, disjoint-commutation and reverse-commutator lemmas. Read their variable context and index hypotheses. General associative-ring bridges remain gaps; the existing declarations are not falsely widened.

Read the reviewed audit for every scoped T.1/T.2 entry. It identifies no existing implementation of stable Steinberg groups, this K2 model or Milnor K-theory; the unrelated Lie-theoretic Steinberg names are not reused. Read the current owner contracts in KTheoryLowDegrees U.1/U.2/U.3, GeneralAlgebraicKTheory K.2:plus/K.7, StableHomotopyKTheory H.3, K3BlochGroups V.2 and the accepted RS-28 ownership of all-degree Milnor K-theory. Stable GL/E and elementary calculus are imported from U.1, classical K1 from U.2, products/continuity from K.7, and only the early plus model from K.2:plus. Removed the incoming V.2 consumer edge and changed HL.1 coordination to an outgoing consumer contract. No roadmap file or other packet was edited.

## Granularity, API and suggested file

Separated the elementary-map construction, the K2/K1 exact sequence, extension morphisms, extension classification, perfect-source rigidity, the two presentation central extensions, separate finite and stable Steinberg perfectness, separate indexed Weyl and diagonal-lift words, the unrestricted negative-unit identity, arbitrary-extension torsion, and four additional Milnor field computations. All added nodes carry `addedBy: REV-K2SymbolsBrauer--T.1`. Definitions/constructions have at least three tests. Generator extensionality, colimit lift, kernel extensionality, quotient universal property and product-symbol/naturality APIs were added where consumers need them. Planets retain the existing key definitions/named theorems; none is added to an already full six-planet layer.

The suggested file replaces True/Unit stand-ins, self-maps and self-equivalences with actual predicates and kernel-valued constructions, or explicitly commented intended signatures when the carrier belongs to a missing owner. Star inputs are in E, maps have distinct classical/Quillen codomains, word indices are retained, and no unproved result is represented by a vacuous proposition. It is not compiled: an existing build at both pinned commits was unavailable; no Lake project, cache download or build was created.

## Node-by-node check

| Node | Verdict | Evidence and correction |
| --- | --- | --- |
| `steinberg-group-finite-rank` | corrected | III.5.1 PDF 225 checked; corrected false exhaustiveness/rank-two explanation and added a noncommutative product-order test. |
| `elementary-matrices-satisfy` | corrected | III.5.1.1 checked; split the quotient map into an added construction and exposed the missing general-ring bridge. |
| `stabilisation` | corrected | III.5.1.2 checked; elementary groups are imported from their actual U.1 owner and the missing group-colimit API is explicit. |
| `k2-definition` | corrected | III.5.2 checked; removed the late K.2 comparison dependency and separated the exact sequence. The Z computation is a deferred T.5 test. |
| `k2-is-centre` | unverifiable | III.5.2.1 checked; the statement is stable and correct, but the column and centre inputs remain undecomposed. |
| `central-extension` | corrected | III.5.3 checked; separated morphisms and classification, narrowed the pinned classification claim and replaced policy-only tests by C2/C4/C9 examples. |
| `universal-central-extension` | corrected | III.5.3.1 checked; universality is over all central extensions of G, not fixed A; supplied counterexample-sensitive tests. |
| `uce-perfect` | corrected | Split Lemmas III.5.3.2 and 5.3.3 into perfectness and rigidity nodes; arguments checked. |
| `hopf-formula` | unverifiable | III.5.3.4-.5 checked; separated both extension constructions and corrected the false free-target kernel test. Hopf-to-bar comparison remains unverified. |
| `recognition-theorem` | unverifiable | The equivalence of III.5.4 checked, but its Hopf/perfectness and central-composition inputs remain undecomposed. Removed an unverified A5 computation. |
| `steinberg-is-uce` | corrected | III.5.5 checked; supplied missing perfectness and the compatibility/gluing argument from finite splitting to stable splitting. |
| `finite-rank-splitting` | corrected | III.5.5.1 checked; removed the unjustified finite-rank UCE deduction and recognition dependency. Expanded-lift calculations still need a proof decomposition. |
| `finite-rank-caveat` | corrected | Replaced a policy-only lemma with a precise conditional centrality result; proof is a kernel commutator argument. No general finite-rank injectivity claim added. |
| `k2-h2-elementary` | corrected | III.5.5 checked; corrected coefficients and recorded the missing map-level naturality bridge, rather than a self-equivalence. |
| `k2-pi2` | corrected | Corrected wrong K3 locator IV.1.20/Ex.1.9 to IV.1.7.1/Ex.1.8. Read H.3 and K.2:plus; their covering/Hurewicz interfaces remain requested. |
| `star-product` | corrected | Star-product passage PDF 233 checked; restricted the domain to E, made commutation hypotheses explicit and retained the U.1 block-factorization dependency. |
| `steinberg-symbol` | corrected | III.5.10 and .1 checked; retained associative-ring commuting units, split the indexed w/h words and qualified general-ring matrix and bilinearity interfaces. |
| `steinberg-identity` | corrected | Separated the two different hypotheses of III.5.10.2-.4. The arbitrary-unit extension is a new node with its universal-localization proof gap. |
| `symbol-consequences` | corrected | III.5.10 and .3-.4 checked; {-,-} is skew, and {a,a}={a,-1} may be nonzero. The negative-unit input is now explicit. |
| `symbols-generate` | unverifiable | III.5.10.5 and its preceding prose checked; narrowed the local/semilocal scope to the documented commutative case. Original generation proofs remain unverified. |
| `matsumoto` | unverifiable | III.6.1 PDF 239 states the theorem and refers out for its proof; the missing normal forms are now explicitly unverified. |
| `k2-finite-field` | corrected | III.6.1.1 proof checked including the even/odd cases and nonsquare counting; cyclicity is an exposed prerequisite, not supplied by ZMod. |
| `rational-function-field` | corrected | Split III.6.1.2 from .3, removed the irrelevant finite-field prerequisite and covered leading-coefficient cancellation. |
| `milnor-k-theory` | corrected | III.7.1 checked; quotient grading and Matsumoto comparison are separate inputs; added the generator extensionality/universal property used by the graded comparison. |
| `milnor-alternating` | corrected | III.7.1 uses alternating to mean sign under permutation. Corrected the false square-root-of-minus-one test with the C(t) residue counterexample; no strict integral alternation is asserted. |
| `milnor-examples` | corrected | Separated the finite, algebraically closed, real, number-field and positive-characteristic global computations; corrected degree restrictions. External computations remain explicit gaps. |
| `graded-map` | corrected | Corrected the false noninjectivity and real-place/rank tests. Read IV.1.10.1 and VI.4.3.2; moved products to K.7 and exposed product-symbol compatibility. |
| `graded-map-degree-three` | corrected | Replaced the irrelevant definition-only locator with the product map and injectivity statement. Removed the V.2 incoming prerequisite to avoid reversing the consumer edge. |
| `to-elementary` | added | Split from K2SymbolsBrauer:T.1/elementary-matrices-satisfy; III.5.1.1 (PDF p. 225). The generator assignment x_ij(r) -> e_ij(r) descends to a surjective homomorphism St_n(R) -> E_n(R), where E_n is the subgroup generated by elementary matrices imported from KTheoryLowDegrees:U.1. |
| `k2-k1-exact` | added | Split from K2SymbolsBrauer:T.1/k2-definition; III.5.2 (PDF p. 225). The sequence 1 -> K2(R) -> St(R) -> GL(R) -> K1(R) -> 1 is exact, using the inclusion E(R) <= GL(R) and the quotient GL(R)/E(R) imported from U.1-U.2. |
| `central-extension-hom` | added | Split from K2SymbolsBrauer:T.1/central-extension; III.5.3.1 (PDF p. 226). For central extensions p:X->G and q:Y->G define a morphism over G to be a homomorphism h:X->Y with q composed with h equal to p. Such morphisms do not require a fixed map of chosen kernel groups. |
| `central-extension-classification` | added | Split from K2SymbolsBrauer:T.1/central-extension; III.5.3 (PDF pp. 226-227). Equivalence classes of central extensions of G by a fixed abelian group A correspond to H^2(G;A) with the trivial G-action. |
| `perfect-extension-rigidity` | added | Split from K2SymbolsBrauer:T.1/uce-perfect; III.5.3.3 (PDF p. 227). If p:X->G is surjective and X is perfect, and q:Y->G has central kernel, any two homomorphisms h,k:X->Y with qh=p=qk are equal. |
| `relation-central-extension` | added | Split from K2SymbolsBrauer:T.1/hopf-formula; III.5.3.4 (PDF p. 227). For F free and S normal, the projection F/[S,F] -> F/S is a central extension with kernel S/[S,F]. |
| `commutator-central-extension` | added | Split from K2SymbolsBrauer:T.1/hopf-formula; III.5.3.5 (PDF p. 227). The restriction [F,F]/[S,F] -> [G,G] is a central extension with kernel (S intersect [F,F])/[S,F]. If G is perfect its quotient is G. |
| `steinberg-perfect` | added | Split from K2SymbolsBrauer:T.1/steinberg-group-finite-rank; III.5.1 relations and III.5.5 (PDF pp. 225, 228). For n >= 3, St_n(R) is perfect, and its stable colimit St(R) is perfect. |
| `diagonal-lift-words` | added | Split from K2SymbolsBrauer:T.2/steinberg-symbol; III.5.10.1 (PDF p. 233). For i != j and a unit r in an associative unital ring, define w_ij(r)=x_ij(r)x_ji(-r^-1)x_ij(r) and h_ij(r)=w_ij(r)w_ij(-1). Their images are respectively the two-coordinate monomial matrix and diag(r,r^-1). |
| `symbol-negative-unit` | added | Split from K2SymbolsBrauer:T.2/steinberg-identity; III.5.10.3-.4 (PDF p. 234). For every unit r of an associative unital ring R, {r,-r}=1, without requiring 1-r to be invertible. |
| `extension-kernel-torsion` | added | Split from K2SymbolsBrauer:T.2/rational-function-field; III.6.1.3 (PDF p. 239). For every field extension F <= L, the kernel of K2(F) -> K2(L) is torsion. |
| `milnor-algebraically-closed` | added | Split from K2SymbolsBrauer:T.2/milnor-examples; III.7.2(b) and Exercise III.7.3 (PDF pp. 253, 258). For an algebraically closed field F and n >= 2, K_n^M(F) is uniquely divisible. In degree one F× is divisible but need not be uniquely divisible; degree zero is Z. |
| `milnor-real` | added | Split from K2SymbolsBrauer:T.2/milnor-examples; III.7.2(c) (PDF p. 253). For n >= 1, K_n^M(R) is Z/2 generated by {-1,...,-1}, direct sum a divisible subgroup. As a graded ring, K_*^M(R)/2 is F2[epsilon], with epsilon of degree one. |
| `milnor-number-field` | added | Split from K2SymbolsBrauer:T.2/milnor-examples; III.7.2(d) (PDF p. 254). For a number field F with r1 real embeddings and n >= 3, K_n^M(F) is (Z/2)^r1 via the symbols at its real places. |
| `milnor-global-positive-characteristic` | added | Split from K2SymbolsBrauer:T.2/milnor-examples; III.7.2(a) (PDF p. 253). If F has transcendence degree one over a finite field and n >= 3, K_n^M(F)=0. |
| `diagonal-lift` | added | Separated the h definition from the w definition in III.5.10.1 (PDF p.233); its two-word product has the stated diagonal image. |
| `stable-steinberg-perfect` | added | Separated stable perfectness from finite perfectness; generator commutators pass through the colimit (III.5.1 relations/5.5). |

## Remaining work and orchestrator routing

Obtain and decompose the external normal-form/generation/Bass–Tate proofs. Supply Hopf-to-bar and recognition arguments, general-ring matrix bridges, finite lifted-relations details, quotient grading, group colimits and the precise owner interfaces. The packet's node-indexed gaps identify each consumer. These are mathematical implementation-plan deficiencies, not checker failures.

The companion `research/blueprint/readmes/K2SymbolsBrauer--T.1.md` is outside this review's deliverables and was left for its owner to regenerate: it still claims the old counts/coverage, overly broad baseline scope and wrong plus locator. Use the packet and this report for the revised verdict.

Source issue E1 is a confirmed missing degree restriction in the inspected author copy; E2 is a confirmed missing input in the finite-rank deduction. Exercise III.7.3 itself states the intended degree restriction. The author's linked errata returned HTTP 404 and the publisher page HTTP 403. Cached errata search text was incomplete, so neither finding claims novelty or attributes the omission to an unread published edition. The checked sourceVersions entry records the exact author copy. The false degree-three and square-root tests are packet mistakes, not accusations against the source.

Validation results are recorded in the handoff after running the packet checker with the pinned declaration index, source-version/finding checks, ledger completeness, allowed-path checks and diff checks.
