# Independent review — REV-ERRATA-PAPER-MOK-PILA-TSIMERMAN-19

Codex, session `codex-a71f92`, 23 September 2026. Refs #1782.

## Result and independence

The six inherited findings are confirmed after amendment. E1 is narrowed to a closedness-wording slip, with the alleged substantive descent gap removed. E6 is reclassified to affect the alternative proof. Three additional local misprints E7–E9 are confirmed.

The original errata worker was Claude Code, session `cc-fb70e5`. The underlying work identifies other sessions; I did not author these findings. Input commit: `be23fc13d0874153ddad5fceba57d4f4a149558b`. Each entry has an independent reason and verdict; changed fields and this input commit are recorded in `independentReviewAudit`. The final review file is intentional: no finding in this errata review remains undecided. That is not a claim to have closed every proof dependency in the paper.

## Sources, reading and searches

The primary source is the [published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p07-s.pdf), 34 pages, DOI 10.4007/annals.2019.189.3.7. It and the independently fetched [BIMSA copy](https://bimsa.net/doc/publication/2564.pdf) have identical SHA-256:

`1eab0797914752bdc91b4f46692f0a5716be2cc9e0d2dd96b478f1cdb762a0ab`.

The [arXiv v3 PDF](https://arxiv.org/pdf/1711.02189v3), 29 pages, has SHA-256:

`b3de4f10ea6243fafcfc4a12adc939b1c8c6fab620afa00d2860d5313e1c0167`.

I read the introduction and §§2–3 through Corollary 3.2; the jet conventions and §§6–8; Lemma 9.2 and Corollary 9.3 with their proofs; the relevant §10 context and Corollary 10.4; and all of §§11–12 through the final special case. The corresponding v3 passages at the findings were collated. Published images were inspected at pp.951, 959, 965, 969, 971, 972, 974 and 975. The review is targeted, not a claim of a complete rereading of §§3.1–4 or of every cited supplier theorem.

The [author manuscript linked by Mok](https://hkumath.hku.hk/~imr/IMRPreprintSeries/2018/IMR2018-15.pdf) was also fetched (SHA-256 `f6d3fbe93ccbf06fa73532a80a1a999fe4e1a9d2b7c2053d704815196823bf7c`), but only selected text searches were made in it. It is not the basis for a claim that all versions are identical. In fact E3 differs between the published paper and v3.

Correction checks on 23 September 2026:

- [Annals article page](https://annals.math.princeton.edu/2019/189-3/p07): no linked correction.
- [arXiv history](https://arxiv.org/abs/1711.02189): v1, v2 and v3, no version after 20 September 2018.
- [Crossref record](https://api.crossref.org/works/10.4007/annals.2019.189.3.7): empty relation object, no update-to/updated-by fields.
- [Mok's publications](https://hkumath.hku.hk/~nmok/) and [Tsimerman's publications](https://www.math.toronto.edu/jacobt/): no corresponding correction link.
- Pila's Oxford homepage was inaccessible through the web tool; this supplies no negative evidence.
- Exact-title erratum/correction searches and searches targeting the stabilizer lemma, Theorem 11.3, constructible descent and rank found no matching correction.

“New” means not located in those bounded searches, not an exhaustive novelty claim. No author was contacted.

## E1 — Confirmed after downgrading to a wording slip

The published Corollary 3.2 retains a closedness hypothesis that its §11 use does not require. Deleting “closed” is justified by the same argument as the surrounding results; it does not require an unproved general theorem on nonproper images.

Here is the descent argument. Let π:M→Y be the unramified covering in question and A⊂M a saturated constructible analytic set. Suppose B=π(A) is definable; in this application it equals the image of the definable fundamental-domain restriction. Because π is a covering and A is saturated, local inverse branches show

π(cl A)=cl B,  π(cl A\A)=cl B\B.

The closure of a constructible analytic set is analytic. This can be checked locally by writing it as a finite Boolean combination of closed analytic sets and taking the closures of its locally closed pieces. The boundary has smaller dimension. Saturation is preserved by closure and Boolean operations. Consequently cl A descends to a closed analytic subset cl B of Y. Since cl B is definable, Definable Chow makes it algebraic. Apply the same argument inductively to the smaller-dimensional constructible analytic boundary; its image is definable since it is cl B\B. Subtract the constructible algebraic boundary image from cl B.

This is a finite-dimensional induction, not an assumption that arbitrary nonproper analytic images are analytic. It also establishes global constructibility, without relying solely on local constructibility. The maps on finite jet spaces and tangent spaces are themselves coverings: over an evenly covered base neighborhood the maps are biholomorphisms on each sheet, including their jets and tangents. The orbit images V′ and W′ in §11 are restrictions of algebraic constructible images, are Γ-invariant, and have definable fundamental-domain restrictions. Hence the same descent applies.

The entry is therefore retained as a misprint affecting nothing, with the substantive gap allegation removed. The added explanation spells out the routine argument already indicated by Corollary 2.3 and Theorem 3.1.

## E2 — Confirmed sign misprint

The setup on p.958 has Lie(B)=n−⊕k_C. N+ is the opposite unipotent group whose orbit gives the coordinate cell. Thus the p.959 factorization is B=K_C N−. Both the published image and v3 have the wrong sign. This check does not assert a new proof of all §7 results, and uses the effective-action convention intended there.

## E3 — Confirmed, with an important version distinction

Published p.965 incorrectly assigns transcendence degree dim G to C(z₁,…,z_n). The coordinates instead have transcendence degree n. The next paragraph projects the jet graph to J_kX, so its field is generated by the modular functions and all their partial derivatives through order k.

V3 p.18 has a different erroneous field: C(φ₁,…,φ_N), omitting the derivatives. It is not an already-corrected version. A finite “C-basis” should be read as field generators: a positive-dimensional function field is not a finite-dimensional C-vector space. The report applies this convention consistently to the repeated statements. The verdict does not certify every geometric step in the subsequent orbit argument.

## E4 — Confirmed by a same-dimension drop in the actual geometry

A generic disconnected algebraic subgroup example would not by itself settle whether this happens for the paper's jet stabilizers. Here is an explicit example for its Siegel case.

Use the symmetric 2×2 matrix chart of LG(2,4), the compact dual for PSp₄. Put

S=diag(1,0), T=[[0,1],[1,0]], X(t)=tI+t³S+t⁴T.

Work first in Sp₄ and then divide by its central {±I₄}. An element fixing X(0)=0 has block form

g(A,C)=[[A,0],[A⁻ᵀC,A⁻ᵀ]],  A∈GL₂(C), C=Cᵀ.

Its action is X↦A X(CX+I)⁻¹Aᵀ. Comparing coefficients:

1. Fixing the first jet gives AAᵀ=I, hence A∈O₂(C).
2. The second coefficient is −ACAᵀ, while X has zero second coefficient. Therefore fixing the second jet forces C=0.
3. The third coefficient is ASAᵀ. Since S has distinct eigenvalues, an orthogonal A fixing it is diag(ε₁,ε₂), ε_i∈{±1}.
4. Fixing the fourth coefficient requires ATAᵀ=T, hence ε₁ε₂=1.

Thus in Sp₄ the third- and fourth-jet stabilizers have orders four and two; after dividing by {±I₄}, they have orders two and one. Both have dimension zero. This is a holomorphic germ into the compact dual, exactly the class of maps allowed by Lemma 11.1. It can be placed in a bounded-domain coordinate neighborhood as well.

Therefore the printed assertion that each strict stabilizer drop lowers dimension is false within the intended setting. The example does not show that the partition ultimately fails to cover, nor that m=dim G is false, nor that the existential lemma is false. It shows that the given dimension-count reason cannot establish those assertions. A replacement must handle component groups or otherwise prove finite-order determination and the analytic uniqueness step. The reference to possible Scanlon results in the old correction was only a suggestion; I do not claim to have checked or applied such a replacement theorem.

## E5 — Confirmed counterexample; local repair checked separately

Take a torsion-free modular curve, so q is locally biholomorphic, and a sufficiently small disk in the upper half-plane with coordinate t. Let r≥3 and set

w(t)=2t, u(t)=q(t), v(t)=J_rq(id_r(t)).

The pair (w,u) has the required jet-orbit condition because u=q∘h∘w for h(z)=z/2∈PGL₂(C). The third coordinate belongs to the identity leaf of the prescribed foliation and has zeroth-order value u.

If the triple were L(w,g,r), then q(g(2t))=q(t). Local covering uniqueness forces g(2t)=γt for a single fixed γ∈Γ on a connected small disk. Since 2t varies in an open set, g(z)=γ(z/2). Hence q∘g(z)=q(z/2), whose first derivative at 2t is q′(t)/2. This differs from the first derivative q′(t) in v. The example avoids any reliance on the disputed Lemma 11.1 or Theorem 11.2.

Every genuine L satisfies du=v₁dw. Here du=q′(t)dt while v₁dw=2q′(t)dt, so that condition excludes the example.

For the local repair, use the given leaf description: after lifting locally, v(t)=J_r(q∘g₀)(id_r(s(t))) for a fixed g₀. Its zeroth-order value gives u=q(g₀s), hence du=v₁ds. The linear map v₁ is the invertible differential of the local uniformization q∘g₀. Thus du=v₁dw forces ds=dw, and s=w+c on a connected coordinate neighborhood. Translation by c is in the abelian N+ coordinate group. Replacing g₀ by g₀τ_c yields the desired local jet formula, including higher derivatives because a translation has identity first derivative and vanishing higher derivatives.

This verifies the missing local compatibility argument. A global theorem still requires its domain/lifting continuation hypotheses and a valid finite-order characterization. The report does not upgrade this to a complete re-proof of the differential Ax–Schanuel theorem.

## E6 — Confirmed gap in the alternative proof, with the field/rank repair

The formal first derivative r is independent of the derivative of the base map z as its parameters vary. In one target dimension, choose parameters (a,b) in a small bidisk with b≠0, set z=a, r=b, and all higher input-jet coordinates zero. This defines a two-dimensional locus of nondegenerate jets; its graph under J_ℓq is still two-dimensional. Its base map has rank one, with open projection to the modular curve. Thus the error is not confined to constant projections or weakly special points. A constant-base, variable-r example additionally shows why invertibility of r does not supply a right inverse to z.

The field equality follows without any such inverse. At first order R=(Dq)r, giving Dq=Rr⁻¹. At order j, the chain rule expresses the output jet as

D^jq(z)∘r^⊗j + terms involving lower derivatives of q and the known input jet.

Subtract those known terms. The induced operator on symmetric j-tensors is invertible because r is invertible. Recursion recovers all derivatives up to order ℓ rationally from the input and output jet coordinates. The reverse inclusion is the direct chain rule.

Let A=(z,x,y) record the base, its uniformized image, and recovered derivatives, and B the remaining formal input coordinates. Since all entries of A are locally analytic functions of z and z is included, dim A=dim z=a. The differential theorem gives trdeg C(A)≥a+dim G, with its stated weakly special exception. The analytic locus (A,B) has dimension dim U. For the dominant algebraic map between the Zariski closures, generic algebraic fiber dimension is trdeg C(A,B)−trdeg C(A); the analytic fiber has dimension dim U−a and lies inside that algebraic fiber. Therefore

trdeg C(A,B) ≥ a+dim G+(dim U−a)=dim U+dim G.

This justifies the field/rank portion of the repaired deduction, conditional on the differential theorem as its input. Since the original step is invalid, the classification is “the proof,” not “nothing,” even though §10 contains an independent proof of Theorem 9.1.

## E7–E9 — Three additional confirmed notation slips

**E7, §12.2, p.972.** Functional dependence of p₂ on p₁ uses rank(p₁,p₂)=rank(p₁). In the bidisk field, p₁=(t,s), p₂=t gives ranks 2 and 1 and disproves the printed direction; exchanging the tuples gives the converse failure. This is a local analytic notion at regular points, not rational dependence. The applications assume equal ranks, making the two right-hand sides equivalent there.

**E8, §12.4, p.974.** Both displayed Hessian terms lack the superscript 2 on ∂q_i. Differentiating q_i(z(ε)) twice gives Dq_i·D²z+D²q_i(Dz,Dz). The page image confirms both missing superscripts, also present in v3. This is not a separate analytic obstruction to the repair of E6.

**E9, Theorem 12.2, p.975.** The exception for the tuple x∈X^ℓ is a proper weakly special subvariety of X^ℓ, not of X. Applying the preceding theorem to the product group G^ℓ explains both the ℓ dim G term and that ambient variety. For ℓ>1 the exception includes inter-factor relations such as a diagonal. The same slip occurs in v3's theorem labelled 12.5.

## Checks and limits

A scratch-only standard-library script checks 270 exact rational matrix-action cases for the stabilizer example, the four and two signed stabilizer matrices upstairs (orders two and one in PSp₄), and 25 truncated formal-composition recovery examples through order six. It also checks the elementary derivative mismatch and the rank-direction examples. These diagnostics supplement, not replace, the group classification, analytic descent, and generic-fiber arguments above.

Submission checks: errata validator; intake path checker on four deliverables; 65 relevant unit tests; exact diagnostics; read-only simulation that a completed review contributes nine confirmed errata rows. No Lean changed or compiled, and no formalization is claimed.

The paper extraction, roadmap files, queue and generated register are untouched. No finding is left without a verdict, but E4 still needs a full replacement proof and the global differential-system formulation is not certified here. Retain these limits when importing the corrected statements.
