# RT-PAPER-VENKATESH-19

Red team of the accepted extraction PAPER-VENKATESH-19: Akshay Venkatesh, *Derived Hecke algebra and cohomology of
arithmetic groups*, Forum Math. Pi 7 (2019), e7 (arXiv 1608.07234v3). Issue #4252.

Red team: Claude Code, session `cc-c2c06b`, 2 October 2026. I did not write or review:
- the extraction (`cc-7b31c4`, PR #1938);
- its review (`cc-39fac3`, PR #2293).

**Disclosures.** Some findings cite, as existing extractions or owner decisions, work of mine:
- PAPER-BOCKLE-HARRIS-KHARE-ETAL-19, which I fixed (#5338);
- PAPER-CLOZEL-THORNE-17 (#5477);
- PAPER-TREUMANN-VENKATESH-16 (#5236);
- PAPER-BHATT-SCHOLZE-22 (#5391);
- PAPER-LE-LEHUNG-LEVIN-ETAL-23 (#4894);
- PAPER-BAKKER-KLINGLER-TSIMERMAN-20 (#5428);
- PAPER-FU-24 (#5126).

The findings that cite them (/3, /4, /13, /29, /33, /39) carry coordinator notes, and none rests on a verdict of mine.

**The duplication high (/3) rests on BHKT items 17 and 22.** I checked my fix: it changed only item 22's note, and did
not touch item 17.

**Result: 62 findings, 5 high, 24 medium and 33 low.**

## Method

**The source.** The published open-access article (<https://doi.org/10.1017/fmp.2019.6>), 119 pages, downloaded from
Cambridge Core on 2026-10-02. Cambridge stamps each download, so its hash differs from the review's, but the pages
match.

**The passes.** Four parallel passes were run by this session.
- Three read all 119 pages, checking decisive formulas on page images: §§1–3, §§4–7, and §§8–9 with the appendices.
- One checked the two routes, the 11 prerequisites, the planned and library statuses and the briefs.

**Merging.** Fourteen sets of findings reported by two or more passes were merged.

**What I re-verified myself.** Every high finding, against the text:
- **/1.** Route 2's reason itself says the SR stages plan only "the degree-zero parts".
- **/2.** Theorem 5.2 is followed (p. 42) by "almost certainly false … if F is not totally imaginary".
- **/3.** BHKT items 17 and 22 plan Lemma 5.15 and Lemmas 7.3–7.7 with Propositions 7.8–7.9.
- **/4.** The §6.2 package is introduced on p. 56 as "We require that there exist …", "very close to [14, Conjecture
  6.1]".
- **/5.** §7.3 (p. 71) patches arbitrary Taylor–Wiles data, but condition (b) appears only on p. 83.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/papers/PAPER-VENKATESH-19.result.json route 2 (source SmoothRepresentationsOfLocalGroups;
items 4, 5, 17, 18, 19, 24-31, 57, 66, 67)

**Claim.** Route 2 sends 16 missing items into SR.0:derived-extension, SR.1 and SR.4, but none of these stages plans
what is sent. Neither the atlas text nor the RS-21 narrowing plans an Ext-algebra Ext^*_{S[G]}(S[G/U], S[G/U]) or its
models, the derived Satake isomorphism, the torus-localisation Lemmas 3.6-3.10, or the q ≡ 1 Iwahori-Hecke and Morita
statements of Section 4. The route's own reason concedes that the stages hold only the degree-zero parts. PROTOCOL §16
defines 'source' as mathematics that 'belongs inside existing layers', and new layers in the direction of an existing
roadmap as 'part-ii'. As routed, the SR blueprint job would have to add nodes beyond its layer contracts. Every consumer
of SR.1 and SR.4 (SR.2, AL.2, AL.4, ET.6, FA.6, R16.2, GS4, IHG.3, HS3, VS4, ES7) would then wait on the derived Satake
isomorphism and its Smith-theoretic proof.

**Evidence.** SR.4 (atlas): 'For unramified G and a hyperspecial subgroup K, construct the Satake transform and prove
the isomorphism with the appropriate invariant algebra on the dual torus'. RS-21 keeps for SR.0:derived-extension:
'Construct the enhanced derived smooth category on the existing abelian carrier, establishing the needed
Grothendieck/exactness hypotheses, enhancement comparison and derived functor interfaces'. RS-21 keeps for SR.1:
'Compactly supported locally constant functions, A-valued finite-volume convolution ... Identify bi-invariant corners'.
Route 2 reason: 'SR.4 spherical representations and the Satake isomorphism — the degree-zero parts of exactly these
statements'. Paper p. 16, Definition 2.2 (the Ext^* algebra); pp. 29-30, Theorem 3.3 (restriction is an isomorphism onto
H(A_v, A_v ∩ K_v)_S^W for S = Z/ℓ^r with ℓ^r | q_v − 1); p. 38, Lemma 4.5.

**Fix.** Replace route 2 by a part-ii route with parent SmoothRepresentationsOfLocalGroups. Suggested id
SmoothRepresentationsPartIIDerivedHeckeAlgebras, title 'Smooth representations of local groups, Part II: derived Hecke
algebras and the derived Satake isomorphism', area automorphic. Its brief states Definition 2.2, Theorem 3.3 with the
hypotheses of Section 3.2, Lemma 4.5 and the surjectivity of Section 3.4. It imports SR.0:abelian-category, SR.1, SR.2,
SR.4, the tauceti ProfiniteCohomology layers 6, 10 and 12, and ReductiveGroupsPartII RG2.4-RG2.5. Alternatively, move
the 16 items into route 1, as the route reason itself offers. In either case, change the route 1 brief's 'to which this
paper is also routed as a source for the derived versions' accordingly. Also revisit PAPER-KISIN-PAPPAS-18 route 11,
whose SR.1/SR.4 placement of the Iwahori-Bernstein centre cites this route ('Shared upstream owner with the accepted
PAPER-VENKATESH-19 source route (item 29 ...)').

### /2 — error

**Where.** research/blueprint/papers/PAPER-VENKATESH-19.result.json route 1 brief, final theorem (4);
research/blueprint/papers/PAPER-VENKATESH-19.result.json route part-ii brief, final theorem (4)

**Claim.** The brief states Theorem 5.2 without its hypotheses: 'for all but finitely many ℓ, the trivial part of
H^*(Y(K), Z_ℓ) is cyclic over the global derived Hecke algebra ...'. The theorem is proved only for G the norm-one group
of a division algebra of dimension d^2 over an imaginary quadratic field, with K contained in the stabiliser of a
maximal order. The paper says the stated form is almost certainly false when F is not totally imaginary. As a final
theorem for a design job, the brief's statement is false or unproved in the generality it asserts. The review report
claims the brief states Theorem 5.2 'as printed'. Also: The brief states Theorem 5.2 with no setting: 'for all but
finitely many l, the trivial part of H^*(Y(K), Z_l) is cyclic over the global derived Hecke algebra, whose image there
is graded commutative and rationally given by cup product'. The paper proves it only for G = the norm-one group of a
central division algebra D of dimension d^2 over an imaginary quadratic field F, with K inside the stabiliser of a
maximal order. The proof uses compactness of Y(K) and the equality H^*(Y(K), C)_triv = H^*(SU_d, C). The author warns
that the theorem is almost certainly false in this form if F is not totally imaginary. The brief is meant to state the
final theorems exactly as the paper does, so as written it asks the design job for a false general theorem. Item 32 is
correct.

**Evidence.** p. 41, §5.1: 'Let D be a division algebra of dimension d^2 over an imaginary quadratic field F. Let G be
the algebraic group of elements of norm 1 inside D ... We shall suppose K to be contained in the stabilizer of some
maximal order O_D.' p. 42, Theorem 5.2 and the remark after it: 'We also note that the theorem is almost certainly false
(in the form stated above) if F is not totally imaginary'. Also: p. 41, Section 5.1: 'Let D be a division algebra of
dimension d^2 over an imaginary quadratic field F. Let G be the algebraic group of elements of norm 1 inside D ... We
shall suppose K to be contained in the stabilizer of some maximal order O_D.' p. 42: 'We also note that the theorem is
almost certainly false (in the form stated above) if F is not totally imaginary'. pp. 45-46: '(This uses compactness of
Y(K); in the general case the answer is substantially more complicated.)'

**Fix.** Replace (4) by: '(4) his Theorem 5.2: let D be a division algebra of dimension d^2 over an imaginary quadratic
field F, G the group of norm-one elements of D, and K contained in the stabiliser of a maximal order O_D. Then for all
but finitely many primes ℓ the global derived Hecke algebra T̃ preserves H^*(Y(K), Z_ℓ)_triv; (i) H^*(Y(K), Z_ℓ)_triv is
cyclic over T̃, generated by the trivial class; (ii) the image T̃_triv of T̃ in End H^*(Y(K), Z_ℓ)_triv is graded
commutative, and T̃_triv ⊗ Q_ℓ is the Q_ℓ-algebra generated by H^*(Y(K), Q)_triv acting on itself by cup product.' Also:
Replace (4) with: '(4) his Theorem 5.2: let D be a central division algebra of dimension d^2 over an imaginary quadratic
field F, G the group of norm-one elements of D, and K contained in the stabiliser of a maximal order (so Y(K) is compact
of dimension d^2 - 1). For all but finitely many primes l, the global derived Hecke algebra T-tilde preserves H^*(Y(K),
Z_l)_triv; this module is cyclic over T-tilde, generated by the trivial class; and the image of T-tilde in End H^*(Y(K),
Z_l)_triv is graded commutative and, after tensoring with Q_l, equals the algebra generated by cup product with
H^*(Y(K), Q)_triv.'

### /3 — duplicate

**Where.** research/blueprint/papers/PAPER-VENKATESH-19.result.json items /29 (route 2), /37 (planned), /41, /43, /70
(route 1); route 1 brief

**Claim.** The local Taylor-Wiles-place package for a general dual group Ĝ is already owned by an accepted proposal, the
Part II GValuedDeformationsAndPotentialAutomorphy (PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 route 1). Its items 17 and 22, both
missing and routed there, plan Lemma 5.15 (a deformation at a place with q_v ≡ 1 and regular semisimple Frobenius lands
in a lifted torus), Definition 5.16 (the Ĝ-Taylor-Wiles datum) and Lemma 7.5 (for q ≡ 1 the Iwahori-Hecke algebra
becomes k[X_*(T) ⋊ W]). They also plan Lemma 7.6 (Iwahori versus spherical invariants after localising at a regular χ̄)
and Proposition 7.9 (the diamond action agrees with the Galois action). Venkatesh plans the same local statements again:
Lemma 6.12 (item 43), (50) (item 29), Corollary 6.7 (item 41), local-global compatibility at auxiliary level (item 70)
and the Ĝ-TW datum (item 37). Venkatesh's route 1 brief never mentions the BHKT Part II. Ownership of the Iwahori
presentation is also contradictory across accepted extractions: BHKT route 9 says
SmoothRepresentationsPartIIParahoricCenters 'already owns the Iwahori Bernstein presentation', while
PAPER-KISIN-PAPPAS-18 route 11 and PAPER-CLOZEL-THORNE-17 put it in SR.1/SR.4 because of this paper's item 29.
Coordinator note: PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 was fixed by this session (FIX-RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19,
PR #5338); it is cited only as an existing extraction, and PAPER-CLOZEL-THORNE-17, whose red team this session verified
(PR #5477), only for comparison. The duplication rests on BHKT items 17 and 22, which plan Lemmas 5.15, 7.3–7.7 and
Propositions 7.8–7.9; this session's fix (PR #5338, merge 982d7f7d) changed only item 22's note, not its statement,
locator or route, and did not touch item 17.

**Evidence.** PAPER-BOCKLE-HARRIS-KHARE-ETAL-19/17: 'Lemma 5.15: for v ∈ S with ρ̄|Γ_{K_v} unramified, q_v ≡ 1 mod l and
ρ̄(Frob_v) regular semisimple ... there is a unique torus T̃_v ⊆ Ĝ_{R_ρ̄,S} lifting T_v with ρ_S|Γ_{K_v} valued in
T̃_v(R_ρ̄,S)'. PAPER-BOCKLE-HARRIS-KHARE-ETAL-19/22: 'Lemma 7.5: since q ≡ 1 in k, H_{U_0} ⊗_O k ≅ k[X_*(T) ⋊ W]. Lemma
7.6: ... (Π^{U_0})_{m_χ̄} ≅ Π^U'. Paper p. 66, Lemma 6.12: 'Then any deformation of ρ̄|G_{Q_q} can be conjugated to one
taking values in T^∨'. p. 37, (50): 'Because q is congruent to 1 modulo ℓ^r ... H_I ≅ S[W̃]'. p. 63, Corollary 6.7.

**Fix.** Give the field-independent local statements one owner and let the other import them: the toral-deformation
lemma (BHKT Lemma 5.15 = Lemma 6.12), the q ≡ 1 Iwahori-Hecke algebra (BHKT Lemma 7.5 = (50)), and the Iwahori/spherical
localisation comparison (BHKT Lemma 7.6, Proposition 7.8 ~ Lemma 4.5/Corollary 6.7). For example, the toral lemma could
go to LocalGaloisDeformationRings and the Iwahori statements to one local owner. Add to the Venkatesh brief: 'Import
from Global shtukas and Langlands over function fields, Part II: Ĝ-valued deformation theory and potential automorphy
(GValuedDeformationsAndPotentialAutomorphy) the local Taylor–Wiles-place lemmas (its Lemma 5.15, Definition 5.16, Lemmas
7.5–7.6, Proposition 7.9) in local-field-general form; plan only the number-field and derived-Hecke parts here.'
Reconcile the owner of the Iwahori presentation between BHKT route 9 and KP18 route 11.

### /4 — error

**Where.** research/blueprint/papers/PAPER-VENKATESH-19.result.json item /36;
research/blueprint/papers/PAPER-VENKATESH-19.result.json items /36 and /37 (planned)

**Claim.** The item states the Section 6.2 package as facts ('there are Galois representations ... and for m there is
rho-tilde: Gal -> G^dual(T_{K,m}) with (a)-(e)') and marks it 'planned'. In the paper these are hypotheses ('We require
that there exist ...'), 'very close to [14, Conjecture 6.1]', with (c) and (d) given only in 'vague' form. For a general
split simply connected G over Q the existence of rho-tilde valued in the Hecke algebra T_{K,m}, with local-global
compatibility at Taylor-Wiles and Iwahori level, is open. The cited stages GlobalGaloisDeformations:R04.5 and
DeformationAndDerivedPatchingAlgebra:R03.2 plan deformation rings and Taylor-Wiles primes, not this package. So the
status says the atlas plans something that is a conjectural hypothesis of Theorems 7.6 and 8.5, and because the item is
'planned' it sits on no route. Also: Item 36 is the paper's Section 6.2 assumption package: Ĝ-valued Galois
representations with Hecke-algebra coefficients, big image, crystalline at p, local-global compatibility at Taylor-Wiles
primes, and H^0 = H^2 = 0 at q in S. It is marked planned at R04.5/R03.2, although its own review note says 'The
assumption package itself is the paper's own and is not planned'. The parallel Section 6.1 package (item 35) is missing
and routed. Item 37 is marked planned at R04.5 only, which mismatches both its parts. Its Ĝ-valued Taylor-Wiles datum
(strongly regular elements of T^∨(k), T_n = ∏ A(F_q)/p^n) is not R04.5's GL_n-eigenvalue formulation (BHKT/17 note). Its
auxiliary arithmetic level structures Y_0(q), Y_1(q), Y_1(q, n), Y_1^*(Q_n) are arithmetic quotients; the accepted CG18
routes their GL_n analogues to ALS.0/ALS.3. Coordinator note: PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 was fixed by this
session (FIX-RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19, PR #5338); it is cited only as an existing extraction.

**Evidence.** p. 56: 'We make assumptions very close to [14, Conjecture 6.1]. We briefly summarize them and refer the
reader to [14] for full details: ... We require that there exist a Galois representation Gal(Q-bar/Q) -> G^dual(k-bar)
... We require there to exist a Galois representation rho-tilde : Gal(Q-bar/Q) -> G^dual(T_{K,m})'; '(c) (Vague version:
see [14, Conjecture 6.1] for precise formulation)'; '(d) (Vague version: ...)'. p. 57: 'Note that the assumption that
there is a T-valued Galois representation ... is not reasonable unless one has a condition like residual
irreducibility'. Also: R04.5: 'choose primes with prescribed Frobenius eigenvalues and q≡1 mod p^n'.
PAPER-BOCKLE-HARRIS-KHARE-ETAL-19/17 note: 'GlobalGaloisDeformations R04.5 plans Taylor–Wiles auxiliary primes for GL_n
over number fields, with “prescribed Frobenius eigenvalues ...”; the Ĝ-valued version replaces eigenvalues by regular
semisimplicity'. PAPER-CALEGARI-GERAGHTY-18 route to ArithmeticLocallySymmetricSpaces (ALS.0, ALS.3): items
levels-KQ-LQ-Y0Q-Y1Q, level-subgroups-KQ-LQ. Paper p. 56, §6.2 (a)-(e): 'We make assumptions very close to [14,
Conjecture 6.1]'. pp. 57-58, (78)-(82).

**Fix.** Change the kind to definition and the name to 'Galois-theoretic hypotheses of Section 6.2'. Begin the statement
with: 'Hypothesis (assumed in Theorems 7.6 and 8.5; close to Galatius-Venkatesh, Derived Galois deformation rings,
Conjecture 6.1; not known for general G): (i) for every K in K_0 and every character T_K -> k-bar there is a Galois
representation Gal(Q-bar/Q) -> G^dual(k-bar) with unramified compatibility; (ii) for the character (74) with kernel m
there is rho-tilde : Gal(Q-bar/Q) -> G^dual(T_{K,m}) with (a)-(e) as listed.' Keep '(77)' and 'R_rhobar' as
consequences. Set the status to missing and add the item to the part-ii route. Move 'R_rhobar = universal crystalline
deformation ring of rho-bar unramified outside S' into its own planned item (GlobalGaloisDeformations:R04.2,
LocalGaloisDeformationRings:L7). Also: Item 36: status missing, routed to route 1 with the item 35 package. Planned
imports for its ingredients: GlobalGaloisDeformations R04.1-R04.3 (Ĝ-valued functor via BHKT route 7),
LocalGaloisDeformationRings L7 (Fontaine–Laffaille condition), and IntegralHeckeAndGaloisDeterminants IHG.1/IHG.5. Item
37: split it. The auxiliary levels Y_0(q), Y_1(q), Y_1(q, n), Y_1^*(Q_n) become planned at ALS.0/ALS.3, as CG18 routed
them. The Ĝ-Taylor-Wiles datum becomes missing, with the owner fixed by the duplication finding on BHKT. R04.5 keeps
only the existence of such primes. Update the brief accordingly.

### /5 — error

**Where.** research/blueprint/papers/PAPER-VENKATESH-19.result.json items /44 and /37; sourceIssues (missing entry for
Section 7.3, p. 71; cross-reference E1); research/blueprint/papers/PAPER-VENKATESH-19.result.json items /72, /52 and
/54; sourceIssues (new)

**Claim.** Section 7.3 patches 'a sequence of Taylor-Wiles data Q_n' and concludes (d) R = Z_p[[x_1, ..., x_{R-delta}]]
and (g). But a Taylor-Wiles datum (Section 6.3) has no cohomological condition. The condition the argument needs, (b) of
Section 8.10, is stated only on p. 83. Without it the statement fails. By Greenberg-Wiles, the mod-p tangent space of
R_{Q_n} has dimension rs - delta + dim ker(131), where ker(131) is the dual Selmer group of the datum. By (129),
H^1_f(Z[1/S], Ad^*rho-bar(1)) has dimension delta >= 1. Suppose Ad^*rho-bar is irreducible. Chebotarev then gives data
whose primes all kill a fixed nonzero class c locally. For such data each R_{Q_n} needs more than R - delta generators,
which contradicts (113)-(114) with R a power series ring in R - delta variables. Item 44 repeats the omission ('After
passing to a subsequence (Section 7.3): ... R = Z_p[[x_1, ..., x_{R-delta}]]'), so its statement is false as written.
This is a gap in the main chain of Theorem 7.6. E1 records the same omission only for the sentence after Definition
8.11. Also: Items /72 ('For a datum Q_n this gives f_{Q_n}: t_{S_n} = Hom(T_n, Z/p^n) ->> V/p^n (142)') and /52 ('There
is a canonical surjection t_{S_n} ->> V/p^n (142)') assert surjectivity for every Taylor-Wiles datum, and /54
(Definition 8.22) says a strict datum 'then gives an action of V/p^n', which needs that surjectivity. This is false. A
Taylor-Wiles datum (Section 6.3) only requires p^n | q_i - 1 and rho-bar(Frob_{q_i}) conjugate to a strongly regular
Frob^T_{q_i}. Surjectivity of (142) is equivalent (Nakayama, then (147)) to the injectivity (131), i.e. to property (b)
of Section 8.10, and the paper's own proof on p. 88 uses (131). The paper repeats the overstatement on p. 87, in Section
8.21 (p. 94) and in (dagger) of Section 8.26 (p. 96), and no sourceIssue records it (E1 covers only the sentence after
Definition 8.11).

**Evidence.** p. 57: 'A Taylor-Wiles datum of level n is a set of primes Q_n = (q_1, ..., q_s) together with strongly
regular elements ... such that p^n divides q_i - 1, and rho-bar(Frob_{q_i}) is conjugate to Frob^T_{q_i}' (no Selmer
condition). p. 71: 'We choose a sequence of Taylor-Wiles data Q_n with n -> infinity. After replacing the Q_n by a
suitable subsequence and then reindexing ... we can arrange that we can pass to the limit'; p. 72 (d): 'R = Z_p[[x_1,
..., x_{R-delta}]]'. p. 83: 'In the Taylor-Wiles method we choose a set of primes Q such that ... (a) Q is a
Taylor-Wiles datum of some level, and (b) ...'; (131): '(b) [is] equivalent to asking that H^1_f(Z[1/S_Q],
Ad^*rho-bar(1)) -> prod_{v in Q} H^1(Q_v, Ad^*rho-bar(1)) is injective'. p. 82, (129): 'dim H^1_f(Z[1/S],
Ad^*rho-bar(1)) = delta'. Also: p. 87: 'We exhibit now a canonical surjection t_{S_n} ->> V/p^n. (142) In fact, this
surjection uses no more than the fact that Q_n is a Taylor–Wiles datum.' p. 88: 'Now the Taylor–Wiles set Q_n is chosen
(131) so that H^1_f(Z[1/S], Ad^*rho-bar(1)) ↪ prod_{v in Q_n} H^1(Q_v, Ad^*rho-bar(1)) ... When we dualize this ... we
get the surjectivity of (147).' p. 57 (definition of a datum: only 'p^n divides q_i − 1, and rho-bar(Frob_{q_i}) is
conjugate to Frob^T_{q_i}'). p. 94: 'For any Taylor–Wiles datum Q_n ... we have a surjective morphism (see Section 8.16)
f_{Q_n}: Hom(T_n, Z/p^n) ->> V/p^n.' Counterexample: when delta >= 1 take 0 != beta in H^1_f(Z[1/S], Ad^*rho-bar(1))
(dimension delta by (129)). Let L be the field cut out by rho-bar and mu_{p^n}, and K_beta/L the extension cut out by
beta. Pick g in Gal(L/Q(mu_{p^n})) whose image under rho-bar is strongly regular; g has order prime to p. By
Schur–Zassenhaus it lifts to some sigma in Gal(K_beta/Q) of order prime to p, and then the restriction of beta to
<sigma> is a coboundary, i.e. beta(sigma) lies in (sigma − 1)M. By Chebotarev there are infinitely many q with Frob_q =
sigma. Any s of them form a Taylor–Wiles datum of level n with beta|_{G_{Q_q}} = 0 for every q in Q_n. Then (131) fails,
every f_{q,n}(alpha) pairs to 0 with beta mod p, and t_{S_n} -> V/p^n is not onto.

**Fix.** (1) Item 44: replace 'After passing to a subsequence (Section 7.3)' with 'For a sequence of Taylor-Wiles data
Q_n of level n satisfying (b) of Section 8.10, equivalently the injectivity of (131) (such sequences exist by Chebotarev
and the big-image hypothesis 6.2(b)), after passing to a subsequence (Section 7.3)'. (2) Item 37: add to the note that
the data used in Sections 7-8 must also satisfy 8.10(b). Record the existence of such data as an input, planned for GL_n
at GlobalGaloisDeformations:R04.5 and PotentialAutomorphyInfrastructure:PA.4 and missing for general G^dual. (3) Add a
sourceIssue: kind gap; locator 'Section 7.3, p. 71'; printed 'We choose a sequence of Taylor-Wiles data Q_n with n ->
infinity. After replacing the Q_n by a suitable subsequence ... we can arrange that we can pass to the limit.';
correction 'We choose a sequence of Taylor-Wiles data Q_n of level n satisfying (b) of Section 8.10 ...'; reason as
above; affects 'the proof' (Theorem 7.6). Make E1 refer to it. Also: Item /72: replace '->> V/p^n (142)' by '-> V/p^n
(142); this map is surjective when Q_n also satisfies (b) of Section 8.10, equivalently the injectivity (131) (not for
an arbitrary datum)'. Item /52: replace 'There is a canonical surjection t_{S_n} ->> V/p^n (142)' by 'There is a
canonical map t_{S_n} -> V/p^n (142), surjective when Q_n satisfies 8.10(b)/(131)'. Item /54: prefix Definition 8.22
with 'for a datum satisfying 8.10(b) (so that f_{Q_n} is onto)'. Add sourceIssue: kind error; locator 'Section 8.16
after (142), p. 87; repeated in Section 8.21, p. 94 and in (dagger) of Section 8.26, p. 96'; printed 'In fact, this
surjection uses no more than the fact that Q_n is a Taylor–Wiles datum'; correction 'The surjectivity of (142) needs (b)
of Section 8.10 (equivalently (131)); Section 8.21, Definition 8.22 and (dagger) are to be read for data satisfying (b),
and in the proof of (*) on p. 97 the system Q_n containing q_n must be chosen with (b), which is possible because (b) is
stable under enlarging Q'; reason: the counterexample above; affects: nothing (every use can be arranged with data
satisfying (b)); known: new.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json route 2 …; … | Route 2 sends 16 missing items into SR.0:derived-extension, SR.1 and SR.4, but none of these stages plans what is sent. Neither the atlas text nor the RS-21 … |
| /2 | high | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json route 1 …; … | The brief states Theorem 5.2 without its hypotheses: 'for all but finitely many ℓ, the trivial part of H^*(Y(K), Z_ℓ) is cyclic over the global derived Hecke … |
| /3 | high | duplicate | research/blueprint/papers/PAPER-VENKATESH-19.result.json items /29 …; … | The local Taylor-Wiles-place package for a general dual group Ĝ is already owned by an accepted proposal, the Part II GValuedDeformationsAndPotentialAutomorphy … |
| /4 | high | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /36; … | The item states the Section 6.2 package as facts ('there are Galois representations ... and for m there is rho-tilde: Gal -> G^dual(T_{K,m}) with (a)-(e)') and … |
| /5 | high | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json items /44 …; … | Section 7.3 patches 'a sequence of Taylor-Wiles data Q_n' and concludes (d) R = Z_p[[x_1, ..., x_{R-delta}]] and (g). But a Taylor-Wiles datum (Section 6.3) … |
| /6 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json route 2 …; … | Route 2 omits SR.2, although the models of the derived Hecke algebra need compact induction, Frobenius reciprocity and the Mackey decomposition, which SR.2 … |
| /7 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json route 1 …; … | The brief says the Hecke-trivial theorem rests on 'Quillen's computation of the cohomology of finite groups of Lie type and a Chebotarev argument'. It also … |
| /8 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json route 1 …; … | The brief names three wrong stages. (a) It imports 'Galois representations attached to the cohomology of locally symmetric spaces' from … |
| /9 | medium | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json route 1 … | The brief does not name the owners of several planned or partly planned items that its own items depend on, as PROTOCOL §16 requires. These are: item 61 (group … |
| /10 | medium | duplicate | research/blueprint/papers/PAPER-VENKATESH-19.result.json items /2 …; … | Item 2 (Borel-Wallach: dim H^{q+i}_χ = C(δ, i) dim H^q_χ for tempered χ) is routed to the ALS Part II, and the brief asks for 'its own layer'. The accepted … |
| /11 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /11 …; … | Item 11 stays 'planned' (MC.4, PS.3) although its own review note says that Scholl's subspace H^a_mot(M_Z, Q(q)) and its comparison with H^1_f are 'planned … |
| /12 | medium | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /44 …; … | Item 44 is marked planned at DeformationAndDerivedPatchingAlgebra P8, P7 and R03.5, but it bundles arithmetic statements that those stages disclaim. These are … |
| /13 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json …; … | Two prerequisite records point to the wrong papers, so the maintainer would queue the wrong items. The Harris-Venkatesh link arXiv:1810.00920 is A. Kupavskii's … |
| /14 | medium | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json prerequisites; … | Several cited results that the proofs use, and that the atlas does not plan, have no prerequisite record. Section 5 (Lemma 5.3, hence Theorem 5.2) uses Soulé … |
| /15 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /6 …; … | Item 6 asserts that T-tilde(V_0) is graded commutative 'by Section 3 when l does not divide /W/', with V_0(v) = v_l(q_v - 1) at every good place. Good places … |
| /16 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /64 … | Item 64 drops the hypotheses that its proof needs. The primes q_i must be good primes for K not above l (otherwise H_{q_i} is not part of T-tilde at all, and … |
| /17 | medium | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json items (no …; … | The product rule (23) of the invariant-function model, Lemma 3.7 (via 'the usual formula [6, Proposition 9.5]', the Mackey double-coset formula), Lemma 3.8 … |
| /18 | medium | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json items (no …; … | Sections 2.4, 2.7 and 3 rest on structure theory of split p-adic groups that no item records as a cited input: the Cartan decomposition G_v = K_v A_v K_v with … |
| /19 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json route 1 …; … | The brief tells the design job to plan 'the strict variant obtained by restricting to places where the local algebra is graded commutative', and the report … |
| /20 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /44 | The item writes '(114) R (x)_S S_n = R_n'. In print, (114) is R (x)_S S_n = R-bar_n, where (112) defines R-bar_n = R_n/(p^n, m^{K(n)}) with K(n) >= 2n. As … |
| /21 | medium | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json items (none) … | Sections 6-7 rest on cited results that no item records. Galatius-Venkatesh [14] supplies: Conjecture 6.1, the model for the hypotheses of 6.2; Section 13.5, … |
| /22 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /34 … | Item 34 is 'missing' with an empty planned list. Its review note says the item is 'partly planned' and adds 'Soule's etale Chern classes and van der Kallen … |
| /23 | medium | duplicate | research/blueprint/papers/PAPER-VENKATESH-19.result.json route …; … | The Part II brief plans its own conditional Betti Taylor-Wiles package. It lists auxiliary levels Y_0(q), Y_1(q,n) and Y_1^*(Q_n), the comparison of level 1 … |
| /24 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /15; … | Item /15 assumes that 'the regulator H^1_mot(Q, M_coad,Z(1)) -> H^1_f(Z[1/S], Ad^* rho(1)) (x) Q_p is an isomorphism'. Read literally, this hypothesis can … |
| /25 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /50 | The second sentence of the item, 'The same conclusion holds more generally when there is a semisimple Q_p-algebra ... with the stated properties', has two … |
| /26 | medium | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /74 | The item identifies H^1(A(F_q), Z/p^n) with 'Hom(F_q^*, X^*(T^dual)/p^n)'. The paper, and the construction, need cocharacters: H^1(A(F_q), Z/p^n) = Hom(X_*(A) … |
| /27 | medium | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json items (none); … | No item records the arithmetic-duality inputs that Section 8 uses: Tate local duality and the local Euler characteristic (Section 8.2, Lemma 8.9, the … |
| /28 | medium | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json items (none; … | Section 8 uses, without proof, the existence of Taylor–Wiles data of every level n that satisfy property (b) of Section 8.10, by Chebotarev and the big-image … |
| /29 | medium | duplicate | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /58; … | Item /58 is marked missing and routed to the arithmetic Part II with no import. Its content is the Koszul resolution of B over Sym_B(W) and over B[[x_1..x_r]], … |
| /30 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json route 1 … | Further departures from 'exactly as the paper does'. (3) drops the second assertion of Proposition 8.6 (graded commutativity under a multiplicity-one … |
| /31 | low | library-claim | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /60 … | The cited declarations exist at the pinned commit, but the statement's last clause, 'making ⊕_i Ext^i(X, X) a graded algebra', is not a Mathlib declaration. … |
| /32 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json …; … | The prerequisites are 'the papers this one builds on that the atlas does not yet cover' (§16). Calegari-Geraghty 2018 and Scholze 2015 are already accepted … |
| /33 | low | other | research/blueprint/papers/PAPER-VENKATESH-19.result.json route 1 … | The roadmap id 'ArithmeticLocallySymmetricSpacesPartII' is generic, while ArithmeticLocallySymmetricSpaces already has, or is proposed to have, several Part … |
| /34 | low | other | research/blueprint/papers/PAPER-VENKATESH-19.md (body sections 'What …; … | The reader report was only appended to by the review, so its body still asserts things the review found wrong. It says the explicit action is '(Lemma 2.10)', … |
| /35 | low | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json sourceIssues …; … | Inside the proof of Lemma 3.10 the text cites 'the second paragraph of the proof of Lemma 3.10', i.e. itself; that paragraph ('Let S be the double centralizer … |
| /36 | low | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json sourceIssues …; … | The printed Lemma 3.8 says M is a module 'whose order #M is killed by the order #G_2', which does not parse; the proof needs #G_2 . M = 0. v3 had the correct … |
| /37 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /25 … | Item 25 writes the target of derived Satake as (S[X_*] (x) H^*(A(F_v), S))^W in a statement where F_v denotes the local field ('G split over F_v'). The paper's … |
| /38 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /23 … | Item 23 says 'The mod l^n algebras T-tilde_n form an inverse system whose limit acts on H^*(Y(K), Z_l)'. They do not: an endomorphism of H^*(Y(K), Z/l^n) does … |
| /39 | low | library-claim | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /3 … | Item 3 cites no library, but the double-coset convolution algebra of a Hecke pair is in the pinned libraries: Mathlib defines HeckeRing for a Hecke triple and … |
| /40 | low | other | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /1 … | Item 1 requires the cohomology of Y(K) 'in the orbifold sense' (the paper allows non-neat K, e.g. PGL_2(O) in Section 1.4), but its planned stages ALS.0 and … |
| /41 | low | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json items … | Three statements of the introduction have no item and are not cited in any locator: the Prasanna-Venkatesh action (10) of L_C^* on H^*(Y(K), C)_chi by degree-1 … |
| /42 | low | other | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /15 … | Item 15's statement reads as an assertion ('Then, for the action ... V_Q preserves H^*(Y(1), Q)_Pi'), with nothing in the statement saying it is a conjecture; … |
| /43 | low | other | research/blueprint/papers/PAPER-VENKATESH-19.result.json … | Entry 2 gives 'Exp. Math. 29 (2020)', but the paper cites, and the article appeared in, Exp. Math. 28(3) (2019), 342-361. Entry 3 says Galatius-Venkatesh is … |
| /44 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /31 | The item writes 'restriction of classes to T = A(F_v)', which in the item's own notation reads as the local-field points A_v. In Section 3.2, T is the … |
| /45 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /45 | The straightening lemma rests on the surjectivity of S -> R, i.e. J = IR. That in turn comes from R/IR = R_rhobar = Z_p, by (116) and the no-congruence … |
| /46 | low | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json sourceIssues …; … | Four misprints in my range are unrecorded, plus one inconsistency that reaches two items. (i) p. 64 calls X_*(A) 'the character lattice'; it is the cocharacter … |
| /47 | low | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json sourceIssues … | The proof patches only the summand for the lifts Frob^T fixed in the datum, giving (119). It then says 'Taking the sum over all possible lifts Frob^T, as in … |
| /48 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json route … | The brief glosses the hypotheses of Theorem 7.6 as 'a tempered cuspidal Pi whose Hecke eigensystem m has cohomology concentrated in degrees [q, q+delta], with … |
| /49 | low | library-claim | research/blueprint/papers/PAPER-VENKATESH-19.result.json items /29 … | Item 29 cites no declaration, but the function-side model of (47)-(48) is at the pinned commits. Mathlib has finitely supported S-valued functions on double … |
| /50 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /37 … | Item 37 is planned only at GlobalGaloisDeformations:R04.5, which plans the Galois side: choosing primes with prescribed Frobenius and q = 1 mod p^n. The item … |
| /51 | low | duplicate | research/blueprint/papers/PAPER-VENKATESH-19.result.json items /35 … | Item 69, added in review, restates Section 6.1 (4)-(5), (73) and (74): T_{K_0} defined through the derived category, T_K at deeper level, T_{K_0} -> Z_p, chi … |
| /52 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /71 … | Item /71 is planned at FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3 and SelmerIwasawaCohomology:L4. R07.3 plans the Fontaine–Laffaille functor (exactness, … |
| /53 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /49 | The statement still says 'an action of V_∞'. The review's own note says the printed action is of V, but the statement was not changed. |
| /54 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json items /73 … | Item /73's locator puts (162) in Section 8.26, pp. 97-98; (162) is in the proof of Lemma 8.20, p. 93. Items /52 and /72 write 'Ad rho-bar_n', but the paper's … |
| /55 | low | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json sourceIssues … | The paper announces 'that the image of Lambda^*V in endomorphisms of cohomology coincides with the global derived Hecke algebra' but proves only containment, … |
| /56 | low | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json sourceIssues … | Two misprints are not recorded. (i) In diagram (130) the bottom-right term has denominator H^1(Q_p, Ad^*rho-bar(1)) instead of H^1_f(Q_p, Ad^*rho-bar(1)), so … |
| /57 | low | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json sourceIssues …; … | T is an anisotropic F-torus, but p. 102 identifies motivic cohomology with 'T(Q) ⊗ Q', both in the text and in the Assumption. It should be T(F) ⊗ Q. Also, … |
| /58 | low | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json sourceIssues … | The proof of the multiplicity-one case asserts that the graded commutant of S (x) Lambda^*V_{Q_p} 'contains the image of T-tilde'. That needs T-tilde to … |
| /59 | low | missing | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /59; … | Lemma B.5, the comparison of singular and sheaf cohomology with its compatibility with products, is a cited input ([31] Sella) and is used for the coincidence … |
| /60 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /56 | The item states as fact that 'This action agrees with the derived Hecke formalism at places outside S'. For tori the paper defines the V-action directly by … |
| /61 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json item /57 | Item /57 lumps eleven sections of Appendix A, several of which are distinct results: A.1-A.2 (enough projectives, S[G/U] projective), A.3 (Hom(Q,Q) computes … |
| /62 | low | error | research/blueprint/papers/PAPER-VENKATESH-19.result.json route 2 … | The source route's reason says a reviewer can 'move these fourteen items into the Part II'. After the review added items /66 and /67, the route lists sixteen … |

## Notes for the fix job

- **Routes.** Turn route 2 into a Part II of SmoothRepresentationsOfLocalGroups that imports SR.0–SR.4, including SR.2.
  Import the local Taylor–Wiles statements from the BHKT Part II rather than re-planning them.
- **Statements.** Give route 1's brief Theorem 5.2's setting and Conjecture 8.8's hypotheses. Mark item 36 as a
  conjectural hypothesis, not planned. Add condition (b) to the patching items, and extend E1 to pp. 71, 87, 94 and 96.
- **Inputs and prerequisites.** Add the missing cited inputs as items, fix the three miscited prerequisites, and correct
  the stale report.
