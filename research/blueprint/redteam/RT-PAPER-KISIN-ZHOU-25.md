# RT-PAPER-KISIN-ZHOU-25

Red team of the accepted extraction PAPER-KISIN-ZHOU-25: Mark Kisin and Rong Zhou, *Independence of ℓ for Frobenius
conjugacy classes attached to abelian varieties*, Annals of Mathematics 202 (2025), 1077–1156 (arXiv 2103.09945v2).
Issue #4041.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-442dc5`, PR #2152);
- its review, REV-PAPER-KISIN-ZHOU-25 (`cc-d67081`).

**Result: 90 findings, 7 high, 56 medium and 27 low.**

## Method

**The source.** arXiv 2103.09945v2 (<https://arxiv.org/abs/2103.09945v2>) was re-downloaded on 2026-10-01 with its LaTeX
source. Its SHA-256 is `62d26eb9…f230c34c8`, equal to the extraction's. The final Annals revision is paywalled and was
not read, so misprint findings are scoped to v2.

**The passes.** Six parallel passes were run by this session.
- Four read all 63 pages against the extraction: §§1–2, §3, §4, and §§5–6 with the references.
- One checked the source routes 1–5 and 12, all 23 library items, all 25 planned items and a sample of the missing ones.
- One checked the six Part II routes 6–11 against the atlas, the packets, the accepted restructures, `make_queue.py` and
  other papers' accepted routes.

**Merging.** I merged findings reported by more than one pass:
- the owners of the straight-element and admissible-set theory;
- S34 and normality, with the route 8 brief;
- the two missing steps of A12, with Néron–Ogg–Shafarevich;
- displays, the SF.0 and Lefschetz routes, D17's prerequisite, P07's stage, and number-field Chebotarev.

**What I re-verified myself, in the TeX or the atlas:**
- the BG0/BG1 stage texts (no Iwahori–Weyl combinatorics) and PAPER-HE-18's accepted route for C2, C6 and C7;
- Theorem 4.4.4, which proves normality and density at neat level;
- Proposition 3.3.2(2)(ii), which puts the filtration on 𝔻 ⊗ K for a finite extension K;
- the proof of Theorem 6.2.7, which sets the torus case aside as "a theorem of Shimura–Taniyama";
- Case (1) of Proposition 5.2.3, which uses u⁻¹ for a uniformizer u of K;
- the two dependency cycles, item by item.

**Severities I changed.** These are medium, not high:
- the missing cited results of §2 and Zink's displays, which are missing inputs;
- the duplicates A01/A02 and M05, which are single items;
- the SF.0 route, which holds three small lemmas.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — duplicate

**Where.** routes[1] (BunGAndNewtonStrata BG0/BG1): PAPER-KISIN-ZHOU-25/N07, N08, N09, N13, N15; PAPER-KISIN-ZHOU-25
route 1 (source, BunGAndNewtonStrata BG0/BG1), items N07, N08, N09 and the combinatorial half of N15; against
PAPER-HE-18 route 6 (RootSystemsPartIIDominanceAndDemazure), items C2, C6, C7; PAPER-KISIN-ZHOU-25/N13 (Mu-admissible
set), missing in route 1 (BunGAndNewtonStrata BG0/BG1); against PAPER-GLEASON-LIM-XU-26/D04 (planned
ReductiveGroupsPartII:RG2.4) and PAPER-LE-LEHUNG-LEVIN-ETAL-20/def-2-3-9 (route 4, Reductive groups Part II: modular
representations)

**Claim.** The extended-affine-Weyl combinatorics of KZ §§2.1.4–2.2.2 (Newton point of w in W, sigma-straight elements
and their Newton-length criterion, the mu-admissible set, the straight-class classification) is routed into the Bun_G
layers BG0/BG1, while accepted sibling extractions route the very same definitions and theorems to other owners. Three
roadmaps would plan sigma-straight elements and the straight-class classification, and three would plan Adm({mu}).
BG0/BG1 plan torsors on the curve, B(G), kappa and nu; neither mentions the Iwahori–Weyl group, length, Bruhat order or
the admissible set. Also: The Newton point of an Iwahori-Weyl element, sigma-straight elements, the length/Newton
straightness criterion and the straight-class classification are routed by Kisin-Zhou to BunGAndNewtonStrata as missing
items to build, while an accepted extraction already makes RootSystemsPartIIDominanceAndDemazure the single owner of
exactly these statements in their theta-twisted form, of which sigma is a special case. N07 duplicates HE-18/C2, which
no earlier red team flagged. N08, N09 and N15 duplicate HE-18/C6 and C7. That duplicate was confirmed as
RT-PAPER-HE-18/4, but its fix was never applied on the Kisin-Zhou side. BP-BunGAndNewtonStrata (issue #691) still lists
N07, N08, N09 and N15 as Kisin-Zhou source items to cover, so two roadmaps would build the same theory. Also: Adm(mu) is
a definition about the Iwahori-Weyl group and its Bruhat order. An accepted extraction already records it as planned at
ReductiveGroupsPartII:RG2.4, and it reaches BP-ReductiveGroupsPartII (issue #982) through GLX-26's source route.
Kisin-Zhou routes the same definition, with its parahoric image Adm_J, to BunGAndNewtonStrata as a missing item (issue
#691), which gives it a second owner. Kisin-Zhou's own planned item N24 (RG2.4) states 'the mu-admissible locus is the
union of the indexed double cosets' and depends on N13, so the routing is also inconsistent within the extraction.

**Evidence.** KZ route 1 items N07,N08,N09,N13,N15 (reason: 'BG1 owns Newton/Kottwitz classification and its order. Add
the straight-translation and mu-ordinary results here'). Atlas BG0: 'Construct G-torsors on the existing sousperfectoid
spaces and curve ... Define B(G) as sigma-conjugacy classes'; BG1: 'Construct pi_1(G), its Galois coinvariants, the
Kottwitz map kappa and rational dominant Newton cocharacter nu'. Accepted PAPER-HE-18/C2 (Newton vector by a twisted
power), C6 ('An element w is θ-straight if ℓ((wθ)^k)=kℓ(w) for every positive integer k'), C7 (straight-class
classification, HN14 Thm 3.3) are routed part-ii RootSystemsPartIIDominanceAndDemazure, whose brief says 'Add ... Newton
vectors by powers, twisted reduction, straight elements ... prove ... straight-class classification'. Accepted
PAPER-VANHOFTEN-24/A08 ('An element w∈Wtilde is sigma-straight when ell(w sigma(w)…sigma^(n−1)(w))=n ell(w) ...
equivalently ell(w)=<2rho,nu_w>') and A09 ('Straight sigma-conjugacy classes in Wtilde map bijectively to B(G)') are
routed part-ii HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig. Adm({mu}): PAPER-GLEASON-LIM-XU-26/D04 is 'planned
ReductiveGroupsPartII:RG2.4', PAPER-VANHOFTEN-24/G05 is routed source GeometricSatakeAndFusion, KZ N13 is 'missing'
routed to BG. KZ's own route 10 already uses RootSystemsPartIIDominanceAndDemazure. KZ §2.1.6 p.8: 'We say that an
element w ∈ W is σ-straight if for any n ∈ N, we have ℓ(wσ(w)...σ^{n-1}(w)) = nℓ(w)'. Also: HE-18 route 6 reason,
current text after 'Fix He18 cocenter foundations, source defects and shared ownership' (#5241, 2026-09-30): 'Single
owner: C6–C9 belong to RootSystemsPartIIDominanceAndDemazure. PAPER-KISIN-ZHOU-25/N08,N09 and PAPER-VANHOFTEN-24/A08
import the σ specialization (including the straightness length/Newton criterion); their N15/A09 import only the
combinatorial straight-class classification from this owner.' HE-18/C2: 'choose a positive power killing its linear
part, take its translation displacement lambda and set nu_w=lambda/d. Take the dominant W0 representative' vs KZ N07:
'Choose n with sigma^n acting trivially on W and w sigma(w)...sigma^(n-1)(w)=t_lambda; define nu_w=lambda/n and its
dominant representative.' HE-18/C6: 'An element w is θ-straight if ℓ((wθ)^k)=kℓ(w) for every positive integer k' vs KZ
N08: 'w is sigma-straight when length(w sigma(w)...sigma^(n-1)(w))=n length(w) for all positive n.' HE-18/C7: 'π gives a
bijection from θ-straight conjugacy classes to Im π' vs KZ N15. RT-PAPER-HE-18/4 was confirmed, and
research/blueprint/redteam/RT-PAPER-HE-18.fixes.md item 2 says: 'In PAPER-KISIN-ZHOU-25.result.json N08/N09 ... replace
duplicate construction plans by imports of this owner. For KZ N15 ... separate this combinatorial import from their
remaining B(G) theorem.' The KZ result was last edited on 2026-09-29 (#4626), and N07, N08 and N09 are still in route 1.
BG0 and BG1 stage texts mention neither straight elements nor Iwahori-Weyl Newton points. Also: GLX-26/D04, planned
['ReductiveGroupsPartII:RG2.4'], listed in GLX-26 route 1 (source, ReductiveGroupsPartII), review accepted 2026-09-24:
'Adm(mu) consists of w in Wtilde satisfying w <= t^lambda for some lambda in W0 times the dominant inertia coinvariant
mu-bar. Parahoric admissibility is the corresponding double-coset image.' KZ N13: 'Adm(mu) consists of elements w below
t_x(mu) in extended Bruhat order for some x in W_0; Adm_J is its image in W_J backslash W slash W_J.' LLL-20/def-2-3-9:
'Adm(λ) := {w̃ ∈ W̃ | w̃ ≤ t_{s(λ)} for some s ∈ W}' (route 4 accepted). Issue #982's body contains
'PAPER-GLEASON-LIM-XU-26/D04', and issue #691's body contains 'PAPER-KISIN-ZHOU-25/N13'. KZ N24 prerequisites:
['N13','N22'].

**Fix.** Do not plan these in BG0/BG1. Route N07, N08, N09 and the W-side of N15 (bijection from straight sigma-classes
of W to their (kappa, nu) image) to the single owner already chosen by the accepted sibling extractions, as imports of
PAPER-HE-18/C2, C6, C7 and PAPER-VANHOFTEN-24/A08, A09, and reconcile those two owners in one place. Keep only the
comparison Psi: B(W,sigma) -> B(G) and the B(G)-side items (N14, N16–N18) with BG1. Give N13 one owner together with
GLX-26/D04 and VANHOFTEN-24/G05. That owner should be RG2.4 or GeometricSatakeLocalModelsPartII, where its consumers M05
and C01 already live, not a Bun_G layer. Also: Move N07, N08 and N09 out of route 1 into route 10. Route 10 already has
the id RootSystemsPartIIDominanceAndDemazure, the same roadmap as HE-18 route 6. In their notes, record that they are
the theta=sigma specializations of HE-18/C2 and C6 and are planned once there. Restrict N15 to its B(G) step: straight
sigma-classes biject with B(G) through Kottwitz's (kappa, nu) classification, He14 Theorem 3.7. Keep N15 in route 1 at
BG1 and add a prerequisite note importing HE-18/C7. Rewrite route 1's reason so it no longer claims straight elements
for BG0/BG1. Also: Change N13 to status planned, with planned = ['ReductiveGroupsPartII:RG2.4'], and note that it is the
same definition as GLX-26/D04 including the Adm_J double-coset image. Remove N13 from route 1. Add a maintainer note
that LLL-20/def-2-3-9 plans a third copy in the Reductive groups Part II design; it should import RG2.4.

### /2 — error

**Where.** PAPER-KISIN-ZHOU-25/S34 (Theorem 1.3(1), introduction form; Theorem 4.4.4); PAPER-KISIN-ZHOU-25/S34;
routes[8] brief (ShimuraVarietiesHondaTatePartII); missing item for Theorem 4.4.4(1); Route 8 brief ('Prove density with
the stated ordinary-existence and normality hypotheses') and PAPER-KISIN-ZHOU-25/S34; PAPER-KISIN-ZHOU-25/S34 (no
consumers); PAPER-KISIN-ZHOU-25/E11 prerequisites

**Claim.** S34 turns a conclusion of the paper into a hypothesis. S34 reads 'At neat away-p level, when the special
fiber in §4.4 is normal, the mu-ordinary locus is open and dense', and its note says 'Ordinary existence and normality
remain visible assumptions'. But Theorem 4.4.4 proves normality as part (1), with no normality hypothesis. Theorem
1.3(1) is unconditional for strongly acceptable triples. Existence of [b]_mu is automatic there: Definition 4.2.2 makes
G_{2,Q_p}^der a product of restrictions of split groups, so G_{2,Q_p} is quasi-split, and Remark 2.2.5 applies. S33
itself says 'for strongly acceptable triples quasi-splitness ensures existence'. No item states Theorem 4.4.4(1),
although §5.2.1 uses it. S34 has no consumers, although Prop 5.3.5 uses the density. Also: S34 turns a result the paper
proves into a hypothesis. It says the mu-ordinary locus is open and dense 'when the special fiber in §4.4 is normal'.
Theorem 4.4.4 instead assumes only that K_2^p is neat. Its part (1) PROVES that the special fibre S_{K_2} is normal, and
part (2) deduces density from (1). No item extracts Theorem 4.4.4(1). S34's own note admits that '(cc-442dc5) Theorem
4.4.4(1) proves the normality', but the statement keeps normality as an assumption. The route-8 brief asks to 'Prove
density with the stated ordinary-existence and normality hypotheses', and the report says 'Ordinary density retains the
existence and normality hypotheses'. The introduction's Theorem 1.3(1), to which S34 is mapped, is unconditional for
strongly acceptable triples. Existence of [b]_mu is also automatic here: G_2^der is a product of Res_{F_i/Q_p} of split
groups, so G_2 is quasi-split, and S33 itself says so. As extracted, the roadmap would build only a conditional density
theorem. The main l-independence theorem needs the unconditional one (see the next finding). Also: The brief and S34
state Theorem 1.3(1)/4.4.4 with normality as an assumption, but the paper proves normality (Theorem 4.4.4(1)) and then
derives density from it. No item records 4.4.4(1), so the headline theorem is weakened, contrary to section 16 ('states
the final theorems exactly as the paper does'). Also: No item lists S34 as a prerequisite. The proof of Proposition
5.3.5 (E11) does use that the mu-ordinary locus is open and dense: the curve through a point of the open KR stratum must
meet the mu-ordinary locus in a dense open subset, and Corollary 4.4.13 (S39) is applied there. E11's prerequisites
(C12, E07–E10, S39) omit S34. The density theorem therefore lies off the dependency path of the main theorem (E15, A12).

**Evidence.** KZ p.4, Theorem 1.3: 'Assume the triple (G, X, Kp) is strongly acceptable. Then (1) The µ-ordinary locus
S_K,[b]µ ⊂ S_K is Zariski open and dense in S_K.' KZ p.43, Theorem 4.4.4: 'Assume K_2^p is neat. Then (1) S_K2 is
normal. (2) The µ2-ordinary locus S_K2,[b]µ2 is Zariski open and dense in S_K2,k.' The proof of (1) shows that the
special fibre of the local model is integral, 'noting that ... Adm({µ})_J has a single extremal element when J ⊂ S
corresponds to a very special standard parahoric'. KZ p.34, Def. 4.2.2: 'G_2^der ≅ ∏ Res_{F_i/Q_p} H_i, where ... H_i is
a split reductive group'. KZ p.10, Remark 2.2.5: 'When G is quasi-split, this class is just [b]µ.' KZ p.49, §5.2.1:
'Thus under our assumptions M_k and S_K,k are normal schemes; cf. Theorem 4.4.4.' KZ p.54, proof of Prop 5.3.5: 'such
that the preimage U := ψ⁻¹(S_K,[b]µ) ⊂ C of the µ-ordinary locus is open and dense'. In the extraction no item lists S34
as a prerequisite; E11 lists ['C12','E07','E08','E09','E10','S39']. Also: v2 p.43, Theorem 4.4.4: 'Assume K_2^p is neat.
Then (1) S_{K_2} is normal. (2) The mu_2-ordinary locus S_{K_2,[b]_{mu_2}} is Zariski open and dense in S_{K_2,k}.'
Proof: 'To show (1), it suffices by Theorem 4.2.6 to show that the special fiber of M^loc_{G_2,{mu_{h_2}}} is normal.
Note that the geometric irreducible components of this special fiber are normal (see §3.1.4), and hence it suffices to
show that M^loc ⊗ k is integral. This follows from the argument in [PZ, Corollary 9.4], noting that as in loc. cit. the
mu-admissible set Adm({mu})_J has a single extremal element when J ⊂ S corresponds to a very special standard
parahoric.' Introduction, Theorem 1.3: 'Assume the triple (G,X,K_p) is strongly acceptable. Then (1) The mu-ordinary
locus ... is Zariski open and dense'. Remark 2.2.5 (p.10): 'When G is quasi-split, this class is just [b]_mu.' Also:
Paper p.43: 'Theorem 4.4.4. Assume K^p_2 is neat. Then (1) S_K2 is normal. (2) The µ2-ordinary locus ... is Zariski open
and dense in S_K2,k. Proof. To show (1), it suffices by Theorem 4.2.6 to show that the special fiber of M^loc is normal
... This follows from the argument in [PZ13, Corollary 9.4] ... Adm({µ})_J has a single extremal element'. Theorem 1.3:
'Assume the triple (G,X,K_p) is strongly acceptable. Then (1) The µ-ordinary locus S_K,[b]µ ⊂ S_K is Zariski open and
dense'. S34: 'At neat away-p level, when the special fiber in §4.4 is normal, the mu-ordinary locus is open and dense'.
S34's own note: 'Theorem 4.4.4(1) proves the normality of S_K2'. Also: v2 p.54, proof of Proposition 5.3.5: 'we may find
a smooth geometrically connected curve C over F_q and a map psi: C -> S^mu_{K,F_q} ... such that the preimage U :=
psi^{-1}(S_{K,[b]_mu}) ⊂ C of the mu-ordinary locus is open and dense. By Corollary 4.4.13, the Proposition holds for
points y' lying in the image of U'. Computed from the extraction: no item has PAPER-KISIN-ZHOU-25/S34 among its
prerequisites.

**Fix.** Restate S34 as Theorem 4.4.4(2). Its hypotheses are a strongly acceptable triple and neat K_2^p, with no
normality assumption. Add an item for Theorem 4.4.4(1), 'S_K2 is normal', proved from the integrality of the local-model
special fibre ([PZ, Cor. 9.4]; a unique extremal element of Adm({µ})_J for very special J; normal irreducible
components). Add the one-line lemma 'strongly acceptable ⇒ G_{2,Q_p} quasi-split ⇒ [b]_{µ2} exists' (S14 + N18) as a
prerequisite of S33 and S34. Delete the note's claim that existence and normality stay assumptions. Make E11 depend on
S34, and make the §5.2 curve items that use normality (C09/C12 chain) depend on the new normality item. Also: Restate
S34 as in the paper: for a strongly acceptable triple and neat K_2^p, the mu_2-ordinary locus is Zariski open and dense
in S_{K_2,k}, with no normality or ordinary-existence hypothesis. Add a new theorem item 'Normality of the strongly
acceptable special fibre' (Theorem 4.4.4(1)). Its prerequisites are S23 (étale-local comparison with M^loc), M05 (normal
components) and a new local-model item: M^loc_{G_2,{mu}} ⊗ k is integral at a very special level because Adm({mu})_J has
a unique extremal element (the argument of PZ13, Corollary 9.4). Make S34 depend on the new item and on S33 (with
ordinary existence derived from quasi-splitness through N18/Remark 2.2.5). Correct the route-8 brief and the report
sentence. Also: Add a route-8 item for Theorem 4.4.4(1), 'at neat K^p, S_K2 is normal', proved from M05 and the
single-extremal-element/integral special fibre argument at a very special level, with S23 as prerequisite. Restate S34
as 4.4.4(2) with no normality hypothesis. Change the brief to: 'Prove Theorem 4.4.4/1.3(1): for strongly acceptable
triples at neat level S_K is normal and the µ-ordinary locus is Zariski open and dense.' Also: Add
PAPER-KISIN-ZHOU-25/S34 to E11's prerequisites, or to the curve item that produces C with a dense ordinary preimage
(C11/C12 chain), and state the use: the mu-ordinary locus meets every connected component of the open KR stratum in a
dense open subset.

### /3 — error

**Where.** PAPER-KISIN-ZHOU-25/D13

**Claim.** D13 says the cocharacter mu_y 'can be chosen so that its filtration over W(k) lifts the Hodge filtration of
G_0'. The paper puts the filtration on D tensor K for the finite extension K/breve-Q_p, and mu_y is in general defined
only over K. A mu_y defined over W(k)[1/p] would make its conjugacy class defined over breve-Q_p, so the local reflex
field E would be unramified over Q_p. Condition (A) allows ramified E, for example G=Res_{F/Q_p}GL_n with F/Q_p ramified
and a cocharacter that is non-trivial at a single embedding. As written, D13 is false in that case, and D14 inherits the
error.

**Evidence.** Prop. 3.3.2(2)(ii), p. 25: 'The filtration on D tensor_{breve Z_p} K induced by mu_y lifts the filtration
on the module D(G_0) tensor_{breve Z_p} k.' The consumer, §4.1.7, p. 31, says the same: 'there is a G-valued cocharacter
mu_y ... which induces a filtration on D tensor_{breve Z_p} O_K lifting the filtration on D tensor_{breve Z_p} k.'

**Fix.** Restate D13 as follows. The G_K-valued cocharacter mu_y of D12, with K/breve-Q_p finite, can be chosen so that
the filtration it induces on D tensor_{breve Z_p} O_K, which is the saturation of the one on D tensor K, reduces modulo
the maximal ideal to the Hodge filtration on D(G_0) tensor k. Remove 'over W(k)'.

### /4 — missing

**Where.** PAPER-KISIN-ZHOU-25/A12; PAPER-KISIN-ZHOU-25/A12 (also A11, S24); §1 set-up of gamma_ell(v);
PAPER-KISIN-ZHOU-25/A12

**Claim.** The proof of the main theorem splits off the case where the Mumford-Tate group is a torus (CM abelian
varieties) and settles it by a cited theorem of Shimura-Taniyama. No item covers that case, and A12's prerequisites
(A11, E15, A10, A04) are only the non-torus route through a strongly acceptable Shimura stack. As extracted, A12 (stated
for every A) has no supplier for CM abelian varieties. Also: No item takes the generic Shimura point attached to A to
its reduction, or identifies the reduction's Frobenius class with the Galois Frobenius class of A. Theorem 6.2.7 needs
two things here. (a) The point y~_A in Sh_{K_1}(H_1,X_1)(E) must extend to an O_{E_v}-point of the strongly acceptable
integral model. This needs good reduction, i.e. Neron-Ogg-Shafarevich (prime-to-p Galois action unramified at v), plus
the DVR extension property of Theorem 4.2.6(2). (b) For every ell != p, gamma_{y_A,ell} (Frobenius on the ell-adic tower
local system) must equal the image of gamma_ell(v)=chi_G(rho_ell^G(Fr_v)) under G -> H -> H_1. Neither is an item. S24
(the extension property) is used only by S26 and S28. Neron-Ogg-Shafarevich has no item. A11 stops at the generic point
and A12 depends directly on E15, so E15's conclusion about gamma_{y,ell} cannot be turned into A12's conclusion about
gamma_ell(v). Also: The main theorem's object gamma_ell(v) needs the ell-adic representation to be unramified at v, so
that Frob_v has a well-defined conjugacy class. It also needs the identification with the Frobenius of the reduction.
Unramifiedness is the Néron–Ogg–Shafarevich criterion, which the atlas plans in NeronModelsAndSemistableAbelianVarieties
R11.5. No KZ item names it, while an accepted sibling has it as a planned item.

**Evidence.** arXiv v2 p.59, proof of Theorem 6.2.7: 'We may assume that G is not a torus as in this case A has complex
multiplication and the result is a theorem of Shimura-Taniyama.' No extraction item, note or prerequisite mentions
Shimura-Taniyama or the torus case. The atlas plans the Frobenius calculation at ShimuraVarieties:V5 ('the
Shimura-Taniyama Frobenius calculation') and ComplexMultiplicationAndExplicitReciprocity:CM.5. Also: p.3 (introduction):
'its mod v reduction is a point x_A of the special fiber ... Moreover there is an equality gamma_ell(v)=gamma_{x_A,ell}
as elements of Conj_G(Q_ell).' p.56, §6.1.5: 'For ell != p a prime, rho_ell is unramified at v.' p.59, proof of 6.2.7:
'Thus we may apply it to the reduction y_A in S_K(H_1,X_1)(F_q) ... This implies that there exists gamma in
Conj_{H_1}(Q) such that for all ell != p, we have gamma = gamma_ell(v) in Conj_{H_1}(Q_ell).' p.35, Theorem 4.2.6(2):
'For any discrete valuation ring R of mixed characteristic the map S_{K_{2,p}}(R) -> ... (R[1/p]) is a bijection.' In
the extraction, A11's statement ends at 'obtain the H_1 Shimura stack point', and the reverse dependencies of S24 are
S26 and S28 only. Also: KZ p.2 (§1): 'for any prime ℓ ≠ p, the action of Gal(Ē/E) on H^1_et(A_Ē, Q_ℓ) is unramified at
v, and the characteristic polynomial P_{v,ℓ}(t) of a geometric Frobenius Frob_v ... has coefficients in Z, and is
independent of ℓ.' KZ p.2: 'γ_ℓ = γ_ℓ(v) := χ_G(ρ_ℓ^G(Frob_v)) ∈ Conj_G(Q_ℓ)'; repeated in §6.1.3, p.56: 'For ℓ ≠ p a
prime, ρ_ℓ is unramified at v.' Atlas R11.5: 'Prove Néron–Ogg–Shafarevich and the good/semistable Galois comparisons
required here'. PAPER-KISIN-PAPPAS-ZHOU-26 'neron-ogg-shafarevich' is planned
['NeronModelsAndSemistableAbelianVarieties:R11.5']. No KZ item matches 'Ogg' or 'unramified at'.

**Fix.** Add a theorem item (Theorem 6.2.7, CM case; cited Shimura-Taniyama). Suppose MT(A)=T is a torus and rho_ell
factors through T(Q_ell). At a good-reduction place v above p there is gamma in T(Q)=Conj_T(Q) with
rho_ell^T(Fr_v)=gamma for every ell != p, because the Frobenius of the reduction lies in the CM algebra. Mark it planned
at ShimuraVarieties:V5, with CM.4/CM.5 as alternatives. Make it a prerequisite of A12, and split A12's proof steps into
the torus and non-torus cases. Also: Add a theorem item 'Reduction of the abelian point and Frobenius compatibility'.
Statement: y~_A extends to an O_{E_v}-point of S_{K_1}(H_1,X_1) with special fibre y_A in S_{K_1}(F_q), and for every
ell != p, gamma_{y_A,ell} is the image of gamma_ell(v) in Conj_{H_1}(Q_ell). Prerequisites: S24, E01, E03, A11, and a
new cited item for Neron-Ogg-Shafarevich (planned NeronModelsAndSemistableAbelianVarieties:R11.5). Route it with A11/A12
(ShimuraVarietiesHondaTatePartII) and make it a prerequisite of A12. Also: Add a planned item: Néron–Ogg–Shafarevich,
with good reduction at v giving unramified V_ell(A) for all ell ≠ p (R11.5). Add the smooth-proper specialization
identification of Frob_v with the Frobenius of the reduction, routed where A11 lives. Make A12 (and A11) depend on both.

### /5 — error

**Where.** PAPER-KISIN-ZHOU-25/C05

**Claim.** C05 uses the loop parameter t where the paper uses a uniformizer u of K. In Case (1) the rank-one group is
Res_{K/F_q((t))}SL_2 with K finite separable, and K is ramified in exactly the cases the paper targets (G^der a product
of Weil restrictions from possibly ramified F_i). If e(K/F_q((t)))=e>1, then u_-(t^{-1}x)=u_+(t x^{-1})·diag(t x^{-1},
t^{-1}x)·k with k in SL_2(O_K), so the image lies in the cell of e·alpha^vee, not alpha^vee. The translated curve then
reaches the stratum lambda+e·alpha^vee, which can lie outside the local model, so C05's claim 'for x nonzero its
factorization puts it in the next translation cell' is false for ramified K.

**Evidence.** p.51, Case (1): 'Let u be a uniformizer of K; then we may define a map f: A^1 -> FL, x |-> u_-(u^{-1}x)
... u_-(u^{-1}x) in u_+(u x^{-1}) t_{alpha^vee} L^+G.' Extraction C05: 'use x to u_minus(t^-1 x)', with test
KZ.C05.test2 'For x=1 the matrix is lower unipotent with entry t^-1'. Check: u_+(c^{-1})^{-1}u_-(c) =
[[0,-c^{-1}],[c,1]] = diag(c^{-1},c)[[0,-1],[1,c^{-1}]], whose u-adic valuation is ord_u(c)=-e when c=t^{-1}x.

**Fix.** Replace t^{-1} by u^{-1}, with u a uniformizer of K, in C05's statement, API and tests. State the case as
Res_{K/F_q((t))}SL_2 with parahoric SL_2(O_K) rather than 'the split rank-one factor'. Add a test with K/F_q((t))
ramified quadratic showing that t^{-1} lands in the cell of 2·alpha^vee.

### /6 — error

**Where.** Routes 1 and 2 together with planned items N03, N22 and N24: a stage-level cycle between BunGAndNewtonStrata
BG0/BG1 and ReductiveGroupsPartII RG2.2–RG2.4

**Claim.** The item graph is acyclic, but the owners the extraction assigns produce a stage cycle. ReductiveGroupsPartII
items depend on BunGAndNewtonStrata items: N22 (RG2.2/2.3) and N02 (route 2) need N03, and N24 (RG2.4) needs N13.
BunGAndNewtonStrata items depend on RG2.4: N25 and N26 need N24, N08 needs N05 (RG2.1/2.4) and N07 needs N04. An
accepted restructure binds pi_1(G) and kappa to BG1, and BG1 requires BG0, so wherever N25 is placed in BG0 or BG1 the
stage order closes into a loop: BG1 -> RG2.4 -> RG2.3 -> BG1, or BG0 -> RG2.4 -> RG2.3 -> BG1 -> BG0. The atlas
currently has only RG2 -> BG edges (RG2.1->BG1, RG2.5->BG0, RG2.5->BG1), so the extraction introduces the reverse
direction. Route 1's reason ('importing extended affine Weyl and parahoric structure from RG2') states one direction;
the prerequisites of N22 and N24 create the other.

**Evidence.** KZ prerequisites: N22 (planned RG2.2, RG2.3) -> N03 (planned BG0, BG1); N24 (planned RG2.4) -> N13 (route
1), N22; N25 (route 1) -> N19, N24; N26 -> N25; N08 (route 1) -> N05 (planned RG2.1, RG2.4); N02 (route 2) -> N03. N22
statement: 'integral G_Xi points are fixer points in the kernel of tilde-kappa'. RS-15.result.json (accepted) for
BunGAndNewtonStrata:BG1: 'Own pi_1(G), kappa, dominant Newton invariants, their functoriality and classification/order
statements.' data/atlas.json: BG1.requires includes BunGAndNewtonStrata:BG0; RG2.4 requires RG2.3, which requires RG2.2;
stageEdges include ReductiveGroupsPartII:RG2.1 -> BunGAndNewtonStrata:BG1 and RG2.5 -> BG0/BG1, and none from BG to RG2.

**Fix.** Make the dependency run one way. (a) Re-route N13 to RG2.4 as planned (see the Adm(mu) finding), which removes
N24 -> BG. (b) Split N03. The pure-group part, pi_1(G) with its inertia action and the homomorphism tilde-kappa_G:
G(breve F) -> pi_1(G)_I with its kernel, is needed by N02 and N22 and should be owned in ReductiveGroupsPartII before
RG2.3: route it in route 2, or mark it planned there once that stage takes it. BG1 keeps the B(G)-level kappa and Newton
map and imports tilde-kappa. Record a maintainer note against RS-15's BG1 'keep'. PAPER-KISIN-PAPPAS-18 G01 and
'kottwitz-kernel-and-parahoric-membership', and item 1 of research/blueprint/redteam/RT-PAPER-HE-18.fixes.md, already
put the Kottwitz-kernel description of parahorics in RG2. If the maintainer instead keeps tilde-kappa in BG1, move N19,
N25 and N26 out of route 1 to a stage downstream of both BG1 and RG2.4. Their consumers are S10 (route 8) and D15 (route
7).

### /7 — error

**Where.** PAPER-KISIN-ZHOU-25 route 9 (part-ii ReductiveGroupsArithmeticPartII, parent
tauceti:TauCetiRoadmap/ReductiveGroups) and route 8 (ShimuraVarietiesHondaTatePartII); items E02, E03, E09, E11, A05,
A08, A10, A12, A13, A14, A15

**Claim.** The Reductive-groups continuation and the Shimura continuation depend on each other, so neither can be
designed or built first. Route 9 also holds abelian-variety statements that are corollaries of the paper's main theorem,
so it does not stay in the direction of the Tau Ceti ReductiveGroups roadmap.

**Evidence.** Item prerequisites in the extraction: E03 (route 8) needs E02 (route 9); E09 (route 9) needs E03; E11
(route 8) needs E09. A10 (route 9) needs A05 and A08 (route 8); A12 (route 8, Theorem 6.2.7 = Theorem 1.1) needs A10;
A13 and A14 (route 9) need A12. Route 9 items also depend on ShimuraData D4 (P01 -> A02), AutomorphicBundles B1 (P08 ->
A01, A04) and DeligneWeightsAndPurity DWP.1 (P11 -> E09, A13). The paper, p.60: Lemma 6.3.3's proof uses 'the Hodge
cocharacter and multiplier ... c_G(γ̃)=q^i [Del79, 2.2.3]', and 'Corollary 6.3.4. With the assumptions of Theorem 6.2.7,
suppose that G_der is simply connected...'. Route 8's brief says: 'Import quotient descent and the optional
rational-representative refinement from ReductiveGroupsArithmeticPartII'.

**Fix.** Move A13, A14 and A15 (Lemma 6.3.3, Corollary 6.3.4, Remark 6.3.5(3)) and A04 (6.1.3 / Lemma 6.1.4) into route
8 after A12. Restate E09 with no E03 prerequisite, as a pure group statement: a point of Conj_G(Q̄_ℓ) whose image under
the finite map Conj_G -> Conj_GL(V) is Q-rational lies in Conj_G(Q̄). Restate A10 without the A05 and A08 prerequisites:
injectivity and Galois-equivariance on Conj for a diagonal restriction of scalars and for a central product H×^{Z_H}T.
Their Shimura applications then sit in E11 and A12. Rewrite route 9's brief so that it does not prove Kisin–Zhou 6.3.4,
and route 8's brief so that it proves 6.3.3 and 6.3.4 itself.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | duplicate | routes[1] (BunGAndNewtonStrata BG0/BG1): PAPER-KISIN-ZHOU-25/N07, …; … | The extended-affine-Weyl combinatorics of KZ §§2.1.4–2.2.2 (Newton point of w in W, sigma-straight elements and their Newton-length criterion, the … |
| /2 | high | error | PAPER-KISIN-ZHOU-25/S34 (Theorem 1.3(1), introduction form; … | S34 turns a conclusion of the paper into a hypothesis. S34 reads 'At neat away-p level, when the special fiber in §4.4 is normal, the mu-ordinary locus is open … |
| /3 | high | error | PAPER-KISIN-ZHOU-25/D13 | D13 says the cocharacter mu_y 'can be chosen so that its filtration over W(k) lifts the Hodge filtration of G_0'. The paper puts the filtration on D tensor K … |
| /4 | high | missing | PAPER-KISIN-ZHOU-25/A12; … | The proof of the main theorem splits off the case where the Mumford-Tate group is a torus (CM abelian varieties) and settles it by a cited theorem of … |
| /5 | high | error | PAPER-KISIN-ZHOU-25/C05 | C05 uses the loop parameter t where the paper uses a uniformizer u of K. In Case (1) the rank-one group is Res_{K/F_q((t))}SL_2 with K finite separable, and K … |
| /6 | high | error | Routes 1 and 2 together with planned items N03, N22 and N24: a … | The item graph is acyclic, but the owners the extraction assigns produce a stage cycle. ReductiveGroupsPartII items depend on BunGAndNewtonStrata items: N22 … |
| /7 | high | error | PAPER-KISIN-ZHOU-25 route 9 (part-ii ReductiveGroupsArithmeticPartII, …; … | The Reductive-groups continuation and the Shimura continuation depend on each other, so neither can be designed or built first. Route 9 also holds … |
| /8 | medium | missing | PAPER-KISIN-ZHOU-25/N19, N25, N26 (proof inputs); … | Six results that the paper cites in the proofs of Lemma 2.2.6 and Proposition 2.3.3 have no items. Proposition 2.3.3 is the paper's 'key group theoretic result … |
| /9 | medium | error | PAPER-KISIN-ZHOU-25/N23 | N23 requires a hypothesis the paper does not impose: a group homomorphism inducing the adjoint isomorphism. The paper defines associated parahorics from an … |
| /10 | medium | missing | PAPER-KISIN-ZHOU-25/N15 | N15 merges two different cited theorems from different sources and gives both the status missing. The first is Kottwitz's classification: (kappa_G, nu-bar) is … |
| /11 | medium | error | PAPER-KISIN-ZHOU-25/N03 and N22 (status planned) | The planned status overstates what the named stages plan. N03 needs the integral Kottwitz homomorphism, a surjection G(F̆) -> pi_1(G)_I onto inertia … |
| /12 | medium | missing | §2.1.2 set-up (no item): Steinberg's theorem, Tits's choice of S, … | Several standard facts behind the set-up in §2.1.2–2.2.2 have no item, and the atlas does not plan them. (i) Steinberg's theorem: G is quasi-split over F̆, so … |
| /13 | medium | missing | §2.4 cited results (no items); … | The Néron-model and Bruhat–Tits results cited in §2.4 have no items. They are bundled into gap G-neron ('deferred'). The protocol requires one item per cited … |
| /14 | medium | error | prerequisite edges of PAPER-KISIN-ZHOU-25/R06, R09, R10, R12, R13, … | Several dependency edges in §2 are missing or spurious. (1) R06 (Lemma 2.4.4(2)) has no consumer, yet Prop 2.4.8 (R09) and Prop 2.4.10 (R10) use exactly its … |
| /15 | medium | error | PAPER-KISIN-ZHOU-25/D15 (also D16) | D15 states 'its associated full fixer equals its parahoric' (M-tilde = M) without the standing §3.4 hypothesis G-tilde = G, which the paper's proof uses. … |
| /16 | medium | error | PAPER-KISIN-ZHOU-25/D10 (also D09) | D10 replaces the paper's existential statement with a definite one about the wrong base. Prop. 3.2.7 asserts that THERE EXISTS a versal p-divisible group G_A … |
| /17 | medium | error | PAPER-KISIN-ZHOU-25/M09 | Prop. 3.1.12 is a theorem: under hypotheses on p, acceptability and pi_1 and R-smoothness, existence of a local symplectic Hodge embedding gives a GOOD local … |
| /18 | medium | error | PAPER-KISIN-ZHOU-25/M08 (and M07 prerequisites) | M08 misdescribes the target of Lemma 3.1.10 as 'the restriction of scalars of the base-changed model'. The target is the local model of the Weil-restricted … |
| /19 | medium | error | PAPER-KISIN-ZHOU-25/M03 | M03 drops one of the three conditions in the paper's definition of a local Hodge embedding, 'rho is a minuscule representation', and keeps only 'contains … |
| /20 | medium | error | PAPER-KISIN-ZHOU-25/M04, M08, M10, D10, D11, D12, D13, D14, D19, D20 | These theorem and construction items omit the standing hypothesis p>2 of §3.1.4 onward and §3.2.1. Among the §3 items, only M07 and P05 state it. Prop. 3.1.14 … |
| /21 | medium | error | PAPER-KISIN-ZHOU-25/D01 prerequisites | D01, the local datum of Dieudonne tensors in §3.2.2, lists P08 'Absolute Hodge tensors' as a prerequisite. P08 depends on P01 and P02 (Hodge-type Shimura … |
| /22 | medium | missing | §3.2 cited results (D04, D09, D10); … | Prop. 3.2.7 turns a Dieudonne display into a p-divisible group, using Zink's (or Lau's) equivalence between p-divisible groups over complete local rings with … |
| /23 | medium | missing | §§3.2–3.4 cited result: Anschütz Prop. 10.3 | [Ans, Prop. 10.3] (extension of torsors over the punctured Spec of A_inf or of S) replaces the defective [KP18, Prop. 1.4.3] at three places: Prop. 3.2.7, … |
| /24 | medium | missing | §3.2.1/Def. 3.2.4: Dieudonne crystal over O_K | The paper evaluates the contravariant Dieudonne crystal D(G) of a p-divisible group over a complete local ring R on W-hat(O_K) and on O_K, with its Hodge … |
| /25 | medium | missing | Proof of Prop. 3.1.9 (M07): KPZ Theorem 3.3.25 | The main input to Prop. 3.1.9 is [KPZ, Theorem 3.3.25]: existence of good integral local Hodge embeddings for the Weil-restricted triple, after changing the … |
| /26 | medium | missing | Proof of Prop. 3.1.14 (M10): AGLR Theorem 7.23 | Prop. 3.1.14 rests on [AGLR, Thm 7.23]: the map M^loc(k) -> G(breve F)/G(O_breve F) identifies M^loc(k) with the mu-admissible locus. There is no item for it. … |
| /27 | medium | missing | §3.4.1 (Frobenius element b, its admissibility, He16 Thm 1.1) | No item covers §3.4.1's derivation. Trivializing D by U tensor breve-Z_p writes Frobenius as b sigma with b in G(breve Q_p), well defined up to G(breve … |
| /28 | medium | missing | §3.2.2 (D02/D05): Kisin10 Lemma 1.4.5 | The cocharacter mu_y, which defines the orbit closure M^loc_G (D02) and adaptedness (D05), comes from [Kis10, Lemma 1.4.5]. That lemma says a filtration for … |
| /29 | medium | missing | §3.2.5 (D02/M05): normality of A_G-tilde and of M^loc | The paper asserts 'Then A_G-tilde is normal'. That is, the completion of the local model at y-bar is normal, which follows from normality of M^loc and … |
| /30 | medium | missing | Def. 3.1.6(2), §3.2.2, §3.4.1: the Grassmannian Gr(Lambda) | No item covers the Grassmannian Gr(Lambda), the smooth Grassmannian of rank-d direct summands. It is used to define good embeddings and appears as M^loc = … |
| /31 | medium | missing | §3.4.4 (D18/D19) | No item covers the §3.4.4 construction that Theorem 3.4.5 and §4.1.11 rely on. It has three parts: tensors t_{beta,0} extending s_{alpha,0} whose stabilizer in … |
| /32 | medium | missing | §3.1.1: [KPZ, Remark 3.1.5] | The paper's §3.1 claim that a triple arising at p>2 from a Hodge-type Shimura datum is automatically acceptable and of local Hodge type has no item. It is what … |
| /33 | medium | missing | PAPER-KISIN-ZHOU-25/S34, S33, S04 (Kisin–Madapusi Pera–Shin inputs) | Three cited KMPS results on which §4 rests have no item. (i) The density corollary 'locally integral special fibre implies the mu-ordinary stratum is dense'. … |
| /34 | medium | other | sourceIssues (missed gap); … | Missed source gap in the proof of Lemma 4.3.8(1), on which S31 rests. The proof asserts that 'X_*(G^ab)_I is an extension of Z by X_*(Z^c_G/Z_{G^der})_I' and … |
| /35 | medium | error | PAPER-KISIN-ZHOU-25/S11, S28; … | Corollary 4.3.4 (S28) is stated under the hypotheses of §4.3.1, namely (A') and (B') for both data. Its proof needs the DVR extension property of the SOURCE … |
| /36 | medium | error | PAPER-KISIN-ZHOU-25/S26, S27 | S26 (Proposition 4.3.2, first part) adds the hypothesis 'associated parahorics'. Part (1) of the paper requires only G̃ = G, G̃' = G', that G -> G' extends to … |
| /37 | medium | error | PAPER-KISIN-ZHOU-25/S37, S32, S17, S16, N21, N20, S40 (prerequisite … | S37 (Theorem 4.4.6) depends on S10, Remark 4.1.13 ('ordinary points are very good'). The paper does not prove that remark ('It is possible to show ...'), and … |
| /38 | medium | missing | PAPER-KISIN-ZHOU-25/S37 (completed-local comparison for j_2) | The proof of Theorem 4.4.6 needs j_2: S_{K_3}(G_3,X_3) -> S_{K_2}(G_2,X_2) to induce isomorphisms of completions at special-fibre points. It does so through … |
| /39 | medium | missing | PAPER-KISIN-ZHOU-25/S26, S27 (Pappas–Rapoport inputs) | The cited Pappas–Rapoport results behind Proposition 4.3.2 and Remark 4.1.16(1) have no items, although §16 asks for one item per cited result. They are: the … |
| /40 | medium | missing | PAPER-KISIN-ZHOU-25/S02, S04, S35, P08 (Kisin 2010, … | Several definitions and cited results that §4.1 and §4.4.7 build on have no item. (a) The integral Siegel model S_{K'}(GSp,S^±) over Z_(p): a moduli stack of … |
| /41 | medium | error | PAPER-KISIN-ZHOU-25/S33, S09 | S33 defines the mu_2-ordinary locus of the strongly acceptable model, but lists only N17, S04 and S14 as prerequisites. In §4.4.1–4.4.2 the abelian scheme A_2, … |
| /42 | medium | error | PAPER-KISIN-ZHOU-25/E08 (and E11, sourceIssues) | E08 copies Lemma 5.3.3 ('ell-adic units'), but its consumer E07 (Chin, Theorem 4.6) requires the sheaf to be plain of characteristic p: Frobenius eigenvalues … |
| /43 | medium | missing | PAPER-KISIN-ZHOU-25/E11 (base case); … | The base case of Proposition 5.3.5 needs a curve through a point of the open KR stratum S^mu_K whose preimage of the mu-ordinary locus is dense. No item … |
| /44 | medium | missing | PAPER-KISIN-ZHOU-25/E08, E09 (eq. 5.1.1.1) | No item states the identification (5.1.1.1) of the ell-adic tower local system with the tensor-preserving Isom scheme of the universal abelian scheme's Tate … |
| /45 | medium | other | PAPER-KISIN-ZHOU-25/A06 (sourceIssues) | Unrecorded gap in the proof of Lemma 6.2.1. The proof fixes an ARBITRARY maximal Q_p-torus T containing g_s and then asserts that g_u lies in the unipotent … |
| /46 | medium | missing | PAPER-KISIN-ZHOU-25/A09, A05 | A09 lists the strong-acceptability conditions it checks ('derived factors split ... Zc is a product of induced tori') but omits the first condition of … |
| /47 | medium | missing | PAPER-KISIN-ZHOU-25/A11 (prerequisites) | The Serre tensor construction A ⊗_Q F, with its Tate-module identification V^(A^F) = V^(A) ⊗ F and the polarisation lambda ⊗ F, is a cited construction (Conrad … |
| /48 | medium | missing | PAPER-KISIN-ZHOU-25/C12, E11 (KR stratification of the Shimura stack) | No item defines the Kottwitz-Rapoport stratification of S_{K,k} or proves its properties, although C12 and E11 are stated in terms of 'KR strata' of the … |
| /49 | medium | missing | PAPER-KISIN-ZHOU-25/A04, P08 | Deligne's theorem that Hodge cycles on abelian varieties are absolutely Hodge (Del82, Theorem 2.11) is cited for Lemma 6.1.4 and the Galois-factorisation claim … |
| /50 | medium | error | Route 12 (source, SchemeAndStackFoundations:SF.0), items C21, C22, C23; … | The owner is wrong under an accepted restructure, so these items will be orphaned. The route's reason says 'SF.0 owns smooth and etale scheme morphisms and … |
| /51 | medium | library-claim | PAPER-KISIN-ZHOU-25/C21 (Etale coordinates at a rational smooth …; … | C21 is marked missing and planned to be re-proved from a Jacobian presentation, but its core is already in Mathlib at the pinned commit. If a scheme is smooth … |
| /52 | medium | error | PAPER-KISIN-ZHOU-25/P16 (planned ['DeligneWeightsAndPurity:DWP.3']) … | The planned owner is stale under accepted RS-17. Finite-cover function-field Chebotarev with the constant-field degree congruences now belongs to … |
| /53 | medium | error | PAPER-KISIN-ZHOU-25/D17 (Sigma-centralizer and its isogeny action), …; … | D17's dependence on D15 is spurious, and it creates a roadmap-level cycle. D15 is a Part II item that itself needs BunGAndNewtonStrata items N26 and N11, and … |
| /54 | medium | error | PAPER-KISIN-ZHOU-25/P07 (Integral crystalline and etale comparison), …; … | The named stage does not plan this item. R06.5 owns the comparison theorems' applications to abelian varieties, modular curves, Kuga–Sato varieties and Shimura … |
| /55 | medium | duplicate | PAPER-KISIN-ZHOU-25/A01 and /A02 (route 9, … | Another accepted Part II already plans the Mumford–Tate group of a polarized Hodge structure, as the smallest Q-subgroup containing the Deligne torus image and … |
| /56 | medium | duplicate | PAPER-KISIN-ZHOU-25/M05 (route 6, GeometricSatakeLocalModelsPartII) | The special-fibre theorem for tame local models (Pappas–Zhu Theorem 9.1: reduced special fibre whose irreducible components are normal and Cohen–Macaulay) is … |
| /57 | medium | duplicate | PAPER-KISIN-ZHOU-25/E02 (route 9) and route 9 brief ('Construct … | The Chevalley restriction isomorphism that identifies the invariant quotient G//G with T/W is already routed by an accepted extraction to … |
| /58 | medium | error | PAPER-KISIN-ZHOU-25/E04 (route 3, source … | E04 is a generic definition of compatible lisse systems on a finite-field scheme, but it lists E03, the Shimura-tower Frobenius quotient point, as a … |
| /59 | medium | error | PAPER-KISIN-ZHOU-25/C10 (route 5, source … | The rational-point smooth-atlas lemma is stated for 'the smooth algebraic stack appearing after pulling back the local-model curve' and takes S25, the Shimura … |
| /60 | medium | error | PAPER-KISIN-ZHOU-25/S20 (route 2, source ReductiveGroupsPartII) and … | S20 (Lemma 4.2.4) is a general local-group lemma that has torsion-freeness of X_*(G_ab)_I as a hypothesis, yet it takes the Shimura-specific verification S19 … |
| /61 | medium | library-claim | PAPER-KISIN-ZHOU-25/C25 (route 10, … | C25 ('Integral root-cone dominance') is marked missing and routed for construction, but the pinned Tau Ceti library already has exactly this carrier: the … |
| /62 | medium | error | Route 6 reason ('GlobalShtukas GS.1 supplies classical …; … | GS.1 does not plan the parahoric partial affine flag varieties LG/L^+𝒢 over F_p((t)) (Pappas–Rapoport twisted loop groups) that C01 and C13 use. The import … |
| /63 | medium | missing | PAPER-KISIN-ZHOU-25/E14 (route 9) and route 9 brief ('prove the …; … | E14 needs Chebotarev density for number fields, applied to a Galois closure, but has no prerequisite for it. The brief does not name the Tau Ceti roadmap that … |
| /64 | low | other | sourceIssues (missing entry): KZ p.10 §2.2.3; … | A misprint was silently corrected and not recorded. §2.2.3 orders dominant rational cocharacters by 'non-negative rational linear combination of positive … |
| /65 | low | other | sourceIssues (missing entry): KZ p.11, proof of Lemma 2.2.8 | Three slips in the proof of Lemma 2.2.8 are not recorded. (i) 'ṫ_{w0(µ′)} ∈ [b′]µ' should read [b′]_{µ′}. (ii) 'α ∈ X_*(ker(G → G′))^I' should be rational, … |
| /66 | low | error | locators of PAPER-KISIN-ZHOU-25/N02, N03, N07, N08, N09, N13, N15, … | Several locators point to the wrong subsubsection, and one points to a subsubsection that does not exist (2.1.10). |
| /67 | low | error | PAPER-KISIN-ZHOU-25/R11, R09, N12, S37 (statement precision) | Four statements drift from the paper. (1) R11 has Lemma 2.4.11's locator but states only the lattice step (the primitivity of pi_F^n). The Lemma's actual … |
| /68 | low | other | PAPER-KISIN-ZHOU-25/D07 | D07 defines only 'very good at y-bar'. §3.2.5 also defines the global notion, very good at all points of M^loc_G(k), which is used as (C') in §4.1.14 and in … |
| /69 | low | other | sourceIssues (§3.2, unrecorded misprints) | Two slips in §3.2 are corrected silently by D07 and D10 but are not recorded, contrary to PROTOCOL §18. (1) The ideal is defined as a_G-tilde := m_{A_E}^2 + … |
| /70 | low | other | sourceIssues (§3.4 and its use in §4.1.11, unrecorded misprints) | Four slips in and around §3.4 are not recorded. (1) In §3.4.2, ker(pi_1(M) -> pi_1(G)) is generated by the images of the simple COROOTS of G not in M, not by … |
| /71 | low | error | PAPER-KISIN-ZHOU-25/S02 locator | S02's locator '4.1.2–4.1.3' is wrong. Those subsections hold the Hodge embedding and assumptions (A') and (B'). The closure-and-normalization construction and … |
| /72 | low | error | PAPER-KISIN-ZHOU-25/S03 | S03 states Lemma 4.1.4 imprecisely. (i) The torus hypothesis concerns the centralizer of a maximal Q̆_p-split torus, which is a torus. 'Maximal-split-torus … |
| /73 | low | other | sourceIssues (missed misprints in §4) | Four misprints in §4 are not recorded (each affects nothing). (1) Theorem 4.2.6(2) prints the target of the extension map as the integral model with the wrong … |
| /74 | low | other | sourceIssues E5 / extraction report | The 'affects' value of E5 differs between the files. The JSON says 'affects': 'nothing'. The report's findings list says 'E5 — misprint; affects a stated … |
| /75 | low | error | PAPER-KISIN-ZHOU-25/S37, S05, S08 | Three wording slips. (1) S37 says 'a mu-ordinary geometric special point x'. The input is a geometric point of the special fibre in the mu-ordinary locus. … |
| /76 | low | missing | Remark 4.1.12 (special points over arbitrary characteristic-0 fields) | No item gives the definition of a special point that Theorems 4.1.11 and 4.4.6 and Corollary 4.4.13 use. It is the complex definition (h factors through a … |
| /77 | low | other | sourceIssues (Proposition 5.2.3, Case (3)) | Unrecorded misprint in the Case (3) factorisation. The printed element u_+(-2x^{-1}, 2x^{-2}) violates the defining relation tau(c)c+d+tau(d)=0: for x in the … |
| /78 | low | error | PAPER-KISIN-ZHOU-25/A10, A12 | A10 gives injectivity of Conj_G -> Conj_{H_1} only on Qbar-points, but A12's conclusion is an equality gamma = gamma_ell(v) in Conj_G(Q_ell). That step also … |
| /79 | low | missing | PAPER-KISIN-ZHOU-25/A07 | A07 drops conclusion (2) of Proposition 6.2.4, that H'_{Q_p} is a product of Weil restrictions of split groups. A09 relies on it for the derived-group … |
| /80 | low | other | PAPER-KISIN-ZHOU-25/E11 (sourceIssue review reason) | The verdict on sourceIssue E11 is right but its reason misstates the obstruction. The review says Poonen's theorems are 'stated for a smooth quasi-projective … |
| /81 | low | other | extraction report (source findings, second listing) | The report's second listing of source findings contradicts the JSON for findings in this share. It labels E6 and E7 'affects a stated result' and E8 and E9 … |
| /82 | low | missing | prerequisites | Several papers that §§5-6 cite for steps with no other source are absent from 'prerequisites', and none is in the atlas bibliography. They are: Haines-Rapoport … |
| /83 | low | error | PAPER-KISIN-ZHOU-25/N02 (Iwahori–Weyl exact sequences), missing in … | N02 is marked missing, yet four accepted extractions mark the same exact sequences, or the decomposition W = W_a ⋊ Ω, as planned at … |
| /84 | low | library-claim | PAPER-KISIN-ZHOU-25/L21 (Distinct simple roots have nonpositive … | The cited declaration exists and is correctly named, but the item's statement omits a hypothesis: the lemma is stated only over a characteristic-zero ring, … |
| /85 | low | other | PAPER-KISIN-ZHOU-25/N10 (Newton centralizer Levi), missing in route 2 | N10 cites no supplier, although Tau Ceti already defines the dynamic Levi subgroup, the centralizer of a cocharacter, as a subgroup functor. M_v for a rational … |
| /86 | low | error | PAPER-KISIN-ZHOU-25/P10 (Affine Weil restriction), planned … | This planned owner is now partly stale. Accepted RS-27 (2026-09-29) assigns representability and base change of affine Weil restriction along a finite locally … |
| /87 | low | other | Route 9 title 'Reductive algebraic groups, Part II: arithmetic … | The parent already has a Part II. The accepted RS-31 retitles ReductiveGroupsPartII as 'Reductive algebraic groups, Part II: local structure and arithmetic … |
| /88 | low | other | Route 7 title 'Finite flat group schemes and integral p-adic Hodge … | The parent's current title has changed. The accepted and promoted restructure RS-02 made FiniteFlatGroupsAndIntegralPadicHodgeTheory a Part II of tauceti … |
| /89 | low | other | Briefs of routes 6–11 | The briefs name most imports by id only, without titles, against section 16 ('names the roadmaps it imports from, by title and id'). They also cite sibling … |
| /90 | low | library-claim | PAPER-KISIN-ZHOU-25/C14, /C16, /C17 (route 10) | The folding items define and consume base-preserving diagram automorphisms (the A_{2n} reversal, and symmetries of Cartan diagrams) but do not cite the pinned … |

## Notes for the fix job

- **Owners first.** The straight-element and admissible-set items, the two cycles, the SF.0 and Lefschetz lemmas, and
  the A01/A02, M05 and display duplicates all move items between routes. Settle them together before restating items.
- **The main theorem.** A12 needs two new items: the CM case, as a cited Shimura–Taniyama item, and the reduction of the
  Shimura point with its Frobenius class, with Néron–Ogg–Shafarevich. S34 should state Theorem 4.4.4 as proved.
- **Source issues.** Record the unrecorded gaps and misprints under PROTOCOL §18: Lemmas 4.3.8(1), 5.3.3 and 6.2.1,
  Corollary 4.3.4, and the slips listed in the medium and low findings.
