# Honda–Tate theory for Shimura varieties: ordinary classes and source repairs

**Partial checkpoint — Codex, codex-c83e7a; issue #1314; 23 September 2026.**

The extraction contains 182 items: 17 library, 32 planned and 133 missing. All 172 earlier IDs and statuses survive, including the absolute-Weyl correction N29 and fibre-product proof T23 supplied by Claude Code (cc-fb70e5). The 75 definitions/constructions have 226 API statements and 226 canonical test specifications. Every missing item is routed once among six routes. The new exact certificate executes 2,942 assertions; all eight earlier acceptance families also pass. These are mathematical regression checks, not Lean verification.

The main new conclusion is precise: an ordinary Newton class exists for quasi-split groups, but the author version's unconditional inner-form assertion in §1.3.15 is false. For a quaternion division group there is a unique admissible class, which is basic and strictly below the Hodge average. A greatest admissible class and an ordinary class therefore have different meanings. The geometric density proof still requires the model, component and level-changing correspondence arguments.

## Sources and limits

The source is Kisin–Madapusi Pera–Shin, *Honda–Tate theory for Shimura varieties*, Duke Math. J. 171 (2022), no.7, 1559–1614, [DOI](https://doi.org/10.1215/00127094-2021-0063). The [41-page Berkeley author PDF](https://math.berkeley.edu/~swshin/HT.pdf) was reacquired and freshly read in full, including Appendix A and references. SHA256: `fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db`. Pages 6,11,14,19,20,26,28,29,34,37 were checked as images. The PDF creation metadata is 27 January 2021; it is not treated as a printed revision date.

The final publisher request returned 1,158 bytes of HTML rather than an article. The twelve findings below concern the identified author version; none is attributed to the final Duke text without comparison. Shin's two-page [errata list](https://math.berkeley.edu/~swshin/errata.pdf) was freshly read and has no entry for this paper. Author research/preprint pages, publisher metadata and bounded title/erratum searches were checked. An absent entry does not establish that no correction exists.

[Kottwitz85](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf) was reacquired (SHA256 `51fe79cbe6798ea061128fd294c2459046572fcf5f7ed150c75d50e974819171`) and all 21 PDF pages were freshly read. PDF pages 9,11–15,20 were checked as images for the norm, averaging, slope and decency formulas and quasi-split representative proof. Reading this paper does not close the original Saavedra, Steinberg, Kneser or rational-conjugacy references it invokes. Earlier selected RR96 reads are preserved with their exact limited scope in the JSON.

[Kisin–Zhou arXiv:2103.09945v2](https://arxiv.org/pdf/2103.09945v2), Definition 2.2.4 and Remark 2.2.5 (PDF p.10), explicitly distinguish a greatest admissible class from an ordinary class for non-quasi-split groups. This passage was freshly read; it corroborates the scope distinction. The concrete calculation below supplies its own argument. No uninspected HN18 theorem is imported as a proved supplier.

## What the paper establishes and what remains conditional

For a Hodge-type Shimura datum, the normal integral model at the stated lattice-stabilizer level has tensor-preserving crystalline realizations. An admissible Newton class has a nonempty stratum when its geometric Newton orbit has a Q_p-rational representative. Basic classes and quasi-split groups supply that condition. The theorem gives lower Newton closure inclusion; it does not state arbitrary closure equality.

The all-primes tensor automorphism comparison uses Noot's original independence input before the later generalized Weil-point theorem. General off-diagonal Tate-with-tensors, Conjecture 2.3.4, remains a hypothesis. With it, quasi-splitness at p and no adjoint type-D factors, the paper obtains a geometric coefficient-isogeny CM lift for every point and every maximal torus of its quasi-isogeny group. PEL A/C supplies the off-diagonal comparison unconditionally. Rational coefficient-isogeny lifts additionally use the stated simply connected derived group/Hasse conditions, with a separate odd-degree unitary case. The disconnected type-D exercise and unpolarized isogenies are separate contracts.

Here Qbar-isogeny means a point of a rational coefficient torsor after extending its coefficient field; it is not a lift of the characteristic-p abelian variety to a characteristic-zero base by field extension.

## Ordinary-class calculation

Let E/Q_p be unramified quadratic with nontrivial automorphism τ. Define D=E⊕Ej by j²=p and ja=τ(a)j. The reduced norm of a+bj is N(a)−pN(b). Nonzero summands have respectively even and odd valuations, so the norm cannot vanish. Thus D is division.

After splitting over L=breve Q_p, write J=[[0,p],[1,0]]. The descent action is σ_D(A)=Jσ(A)J⁻¹ and σ_D²=σ². Sending b to bJ identifies σ_D-conjugacy with ordinary σ-conjugacy, but shifts the determinant invariant by one. For even r the semilinear norm identity is

`N_r^σD(b) = N_r^σ(bJ) J^(−r) = p^(−r/2) N_r^σ(bJ)`.

Apply this after a common even decency exponent. It proves that the GL2 slopes of (bJ)σ are the two Newton coordinates of b plus 1/2. The shift is essential: b=1 has Newton zero in D×, while Jσ has slopes (1/2,1/2).

The quasi-split inner form is split GL2. For every integer m, the minuscule Hodge vector μ_m=(m+1,m) equals its own based Galois average. An ordinary class in D× would give GL2 slopes (m+3/2,m+1/2). They are distinct, hence their slope spaces each have dimension one; each slope must be integral by the pinned Mathlib rank-one theorem. This is impossible. Taking m=−1 handles the inverse-Hodge convention (0,−1).

Nevertheless b=p^mJ is admissible: bJ=p^(m+1)I, κ_D=2m+1 and ν_D=(m+1/2,m+1/2). For any admissible class the split slopes a≥c satisfy a+c=2m+2 and a≤m+3/2. If distinct they are integers, so a≤m+1, forcing a=c=m+1. Thus every admissible class has the same κ and ν, and invariant injectivity makes B(D×,{μ_m}) a singleton. Its greatest element is not ordinary.

The rational representative condition is independently visible. An F-rational cocharacter of D× has a Laurent expansion Σa_nt^n. The group law forces orthogonal idempotents a_n summing to one. Division leaves exactly one coefficient equal to one, so every rational cocharacter is central after clearing its denominator. The basic vector above is rational and central, while the proposed noncentral ordinary vector has no rational representative. This is a local counterexample to the universal assertion; it does not by itself test a global model's local-integrality hypothesis.

For quasi-split G choose a rational Borel pair T⊂B and its dominant μ. The torus class κ_T⁻¹([μ]) has Newton vector N_Γμ. Its image in B(G) has κ=μ^sharp and ν=μ^diamond, so it is the unique ordinary class. Kottwitz85 Proposition 6.2 supplies the rational representative. Semicontinuity and bounded Newton finiteness make its stratum open, and the special-point theorem gives nonemptiness. Density still needs the geometric component argument.

## Atomic continuation contracts

### C01. Torus Newton invariant is the Galois average

For an F=Q_p torus T and λ∈X_*(T), let [b_T]=κ_T^{-1}([λ]). Then ν_T(b_T)=N_Γ λ in X_*(T)_Q^Γ. The average is rational; κ_T still retains integral coinvariant torsion.

1. Use the natural isomorphism X_*(T)_Γ→B(T) normalized by valuation one on G_m (Kottwitz85 §§2.2–2.5). For a finite Galois splitting field E/F and maximal unramified subfield E_0, a representative is N_{E/E_0}(λ(π_E))∈T(E_0)⊂T(L). The alternative finite splitting extension over L used by KMPS has the same normalization.
2. Pair with every F-rational character χ. The representative has valuation ⟨χ,λ⟩; the invariant rational cocharacter is uniquely determined by these pairings. Equivalently, Kottwitz85 (2.8.1) is precisely finite orbit averaging.
3. Kottwitz85 §4.4 identifies this valuation map with the tensorial Newton map. Thus the Newton formula follows without discarding κ torsion. The sign-action lattice has nonzero Z/2 coinvariant but zero rational average.

### C02. Ordinary class for a quasi-split group

For connected reductive G/Q_p quasi-split, any geometric cocharacter class {μ} has a unique [b_μ]∈B(G,{μ}) with ν=μ^diamond. Choose a Q_p-rational Borel pair T⊂B and B-dominant μ∈X_*(T). The image of κ_T^{-1}([μ]) has the required invariants. A rational Newton representative exists. This algebraic existence statement does not by itself prove density in an integral model.

1. Choose the rational Borel pair supplied by quasi-split reductive-group theory, with T a maximal torus. The Galois action preserves the dominant chamber; averaging its finite orbit gives a dominant invariant rational cocharacter μ^diamond.
2. Send the torus class κ_T^{-1}([μ]) into B(G). Functoriality gives κ_G=μ^sharp and ν_G equal to the dominant orbit of N_Γ μ=μ^diamond. Hence it is admissible and attains the Hodge bound.
3. All other admissible classes have the same κ and smaller or equal ν. Equality gives equality of classes by N11. N16, with Kottwitz85 Proposition 6.2, supplies (1.1.3.1). The rational Borel-pair and general classification prerequisites are still part of G-local.

### C03. Quaternion division algebra and its split Frobenius model

Fix F=Q_p, its unramified quadratic extension E with automorphism τ, and D=E⊕E j with j²=p and j a=τ(a)j. Then D is a division algebra. Over L=breve Q_p, identify D_L with M_2(L) by a↦diag(a,τa) and j↦J=[[0,p],[1,0]]. The F-descent operator is σ_D(A)=J σ(A) J^{-1}; σ_D²=σ². Put G=D^×.

1. The cyclic presentation has associative multiplication by j a=τ(a)j. Its conjugation sends a+bj to τ(a)−bj and gives norm N_E/F(a)−p N_E/F(b). For nonzero a,b the two summands have respectively even and odd p-adic valuations, so cannot cancel. If one vanishes the other does not. Every nonzero element has inverse conjugate/norm, proving division.
2. The displayed matrices satisfy the cyclic relations; over E their span is M_2(E), giving the splitting after base change. Apply σ entrywise, whose restriction to E is τ. Conjugation by J fixes the embedded a and j; it is therefore the descent action of D. Since σ(J)=J and J²=pI, its square is σ².
3. Use the units of the finite-dimensional central simple F-algebra for the algebraic group, not GL_2 with the untwisted Frobenius. Its quasi-split inner form is split GL_2. The local-field existence of E and general reductive inner-form interface are retained in G-local.

### C04. Transport of twisted sigma-conjugacy by a quaternion matrix

With C03, b↦bJ gives a bijection B(D^×)→B(GL_2), where the left uses σ_D and the right uses σ. It is not a homomorphism or an invariant-preserving identification. κ_GL2(bJ)=κ_D(b)+1.

1. For c∈GL_2(L), compute (c b σ_D(c)^{-1})J=c(bJ)σ(c)^{-1}. Thus the bijection on matrices carries exactly the two equivalence relations, and multiplication by J^{-1} gives its inverse.
2. The reduced norm of b is det(b), so κ_D(b)=v_p(det b). The determinant of J is −p, yielding the shift by one. Do not equate inner-form κ values using this particular set bijection.

### C05. Half-slope shift for the quaternion inner twist

For C03 and C04, if the ordinary GL_2-isocrystal (bJ)σ has dominant slopes (a,c), the dominant Newton vector for b with descent σ_D is (a−1/2,c−1/2).

1. For every even r, induction on the semilinear products gives ∏_{i=0}^{r−1}σ_D^i(b)=[∏_{i=0}^{r−1}σ^i(bJ)]J^{−r}=p^{−r/2}∏σ^i(bJ). Odd r has a noncentral factor J^{−r}, so evenness matters.
2. Choose an even common multiple of the decency exponent for b. If c makes b decent, then it makes bJ σ-conjugate by the same c. Since σ_D^r(c)=σ^r(c), the preceding equality remains valid after the conjugation. The GL_2 decency cocharacter is ν_D+(1/2,1/2).
3. Uniqueness of the Newton cocharacter from the decency characterization (Kottwitz85 §§4.3–4.4) gives the asserted shift. For b=1 the GL_2 class of J has slopes (1/2,1/2), whereas ν_D(1)=0; this checks the normalization.

### C06. Two distinct rank-two slopes are integral

For a two-dimensional isocrystal over Frac W(Fpbar), two distinct slopes must both be integers. Each distinct slope space has dimension one. This consequence uses the rank-one classification and slope decomposition, not a claim that all-rank classification exists in Mathlib.

1. The slope decomposition is Frobenius-stable and the two nonzero summands have dimensions summing to two, hence each has dimension one.
2. Apply WittVector.isocrystal_classification to each summand with its verified finrank-one hypothesis. Its standard Frobenius is p^m σ for an integer m, so each slope is integral. The decomposition adapter comes from VB0; it is not an existing Mathlib theorem about arbitrary rank.

### C07. Quaternion obstruction to an ordinary class

For G=D^× from C03 and any integer m, let {μ_m} have split dominant representative (m+1,m). Then B(G,{μ_m}) has no class with Newton vector μ_m^diamond=(m+1,m). In particular μ=(1,0) and the inverse-Hodge class represented dominantly by (0,−1) both fail ordinary existence.

1. The quasi-split inner form is split GL_2, so the based Galois action is trivial and the Hodge average is (m+1,m). These cocharacters are minuscule.
2. If a class attained this vector, C05 would give ordinary GL_2 slopes (m+3/2,m+1/2). They are distinct and nonintegral, contradicting C06.
3. For the positive example take m=0; for the inverse-Hodge example take m=−1. The obstruction is local and refutes unconditional inner-form existence in §1.3.15. No global Shimura realization, no claim about the final Duke text, and no counterexample to the additional local-integrality hypothesis of Corollary 1.3.16 is inferred.

### C08. A unique maximal admissible class need not be ordinary

For C07, B(D^×,{μ_m}) is a singleton. Its representative is b=p^m J and its Newton vector is (m+1/2,m+1/2), strictly below μ_m^diamond. Thus its unique greatest class is basic and is not μ-ordinary.

1. The proposed b lies in D^×(F), has κ_D=2m+1, and bJ=p^{m+1}I. C05 gives ν_D=(m+1/2,m+1/2); its difference from μ_m is one half of the positive GL_2 coroot, so it is admissible.
2. For any other admissible b, let a≥c be the slopes of (bJ)σ. Their sum is 2m+2 by C04. Admissibility gives a−1/2≤m+1, hence a≤m+3/2. If a≠c, both are integers by C06, forcing a≤m+1; with a≥c and fixed sum this forces a=c=m+1, a contradiction.
3. Hence all admissible classes have a=c=m+1 and the same κ. N11 identifies them. This gives a complete local distinction between a greatest admissible class and attainment of the Hodge average.

### C09. Rational cocharacters of a division algebra are central

For a finite-dimensional division algebra D/F, every F-morphism λ:G_m→D^× is λ(t)=t^n·1 for an integer n. Every rational F-defined cocharacter is central. In C03 the basic class C08 has a rational Newton representative, but the noncentral orbit (m+1,m) has none.

1. An algebraic map into the finite-dimensional affine space D is a finite Laurent polynomial λ(t)=Σ a_n t^n. The identity λ(st)=λ(s)λ(t) implies a_n²=a_n and a_n a_k=0 for n≠k. Also Σa_n=1.
2. A division algebra has only idempotents 0 and 1. Exactly one a_n is 1 and all others vanish. Thus λ(t)=t^n. Clear a positive denominator for a rational cocharacter.
3. For b=p^m J, σ_D(b)=b and b²=p^{2m+1}I; the Newton map is the rational central cocharacter (m+1/2,m+1/2), defined over F. This verifies the witness condition independently of ordinary existence.

### C10. Ordinary Newton class with an explicit witness

For connected reductive G/Q_p and a cocharacter class {μ}, OrdinaryClass(G,{μ}) consists of an actual [b]∈B(G), the equality κ_G(b)=μ^sharp and the equality ν_G(b)=μ^diamond. It is a subsingleton by N11 and can be empty. A rational Newton representative is separate data required by the geometric nonemptiness theorem.

1. Construct the subtype of classes satisfying both equalities. The ν equality implies the admissibility inequality by reflexivity. Injectivity of (κ,ν) proves any two inhabitants equal.
2. C02 supplies an inhabitant for quasi-split G. C07 supplies a genuine empty example. Do not implement a total constructor indexed only by G and μ, or identify the greatest admissible class with an inhabitant.

## Preserved and clarified proof repairs

N29 uses the absolute Weyl group W(G,T), not N_G(M)/M. For GL3 with block Levi GL1×GL2, μ=(0,1,0) and b_M=diag(p,1,1), the normalizer quotient is trivial while a full Weyl permutation repairs the M-Kottwitz class. The earlier continuation transports the general case to the quasi-split form, applies Proposition 1.1.13, and transports back using basic κ-classification. N32 uses this corrected N29 in the non-quasi-split branch. Its original local prerequisites remain open.

T23 uses G′=G×_{G^ab}T. Equal images in G^ab give equal symplectic similitudes, and the projection kernel lies in T∩G^der, which dies in G^ab. Thus the rational map out of the quasi-isogeny group factors through the required quotient. The printed direct product has neither property. This prior repair is retained in full; Noot and Corollary 2.1.9 remain prerequisites.

S11 now separates the actual Tannakian monodromy subgroup H from the chosen tensor stabilizer G_s. Restriction Rep(G_s)→Rep(H) is the appropriate functor. The invariant-morphism enlargement, crystalline extension, pointwise detection of tensor relations and splitting of transported idempotents are listed explicitly. Those obligations remain G-tensors/G-crystal; the false identification H=G_s is not reused.

## Source findings

E1–E7 retain the IDs of the repository errata job by cc-fb70e5. This is incorporation, not an independent review. No review verdict was added. E6's impact is stated as a false general result although the torus application satisfies the repair. E8–E12 are the additional scoped findings.

| ID | Kind | Locator and corrected scope |
| --- | --- | --- |
| E1 | misprint | (1.1.2.2), p.6, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found: c b σ(b) ··· σ^{r−1}(b) σ^r(c)^{−1} = c(rν_b)(p)c^{−1}. |
| E2 | error | Corollary 1.1.15 and its proof, pp.11–12, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found: Replace N_G(M)/M by the absolute Weyl group W(G, T) of a maximal torus T ⊂ M with μ ∈ X_*(T), as in Proposition 1.1.13. Equivalently: some G(Q̄_p)-conjugate μ′ of μ factoring through T makes ([b_M], {μ′}) M-admissible. |
| E3 | misprint | Proposition 1.2.5, p.14, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found: [b_bas(μ_x^{−1})] ∈ B(T_{Q_p}) maps to [b]. |
| E4 | misprint | §2.2.6, definition of an accommodating embedding, p.26, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found: "… if there is a finite collection of strictly accommodating embeddings of Shimura data ι_j …". |
| E5 | gap | Proof of Lemma 2.2.8, p.28, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found: Take G′ = G ×_{G^ab} T, the pairs (g, t) with the same image in G^ab. This lies in GSp(V ⊕ V, ψ ⊕ ψ), and X′ = X × {h_T} still maps into it because h^ab is constant on X. The kernel of G′ → G is T ∩ G^der, which dies in G^ab, so the composite I_{s′_0} → T → G^ab does factor through I_{s_0}. The rest of the proof then goes through. |
| E6 | error | Lemma 2.2.11, p.29, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found: Assume in addition that S is reduced and separated (for example a variety). Then two automorphisms that agree on a dense set of points agree, because their equalizer is a closed subscheme containing a dense set, and the proof applies. |
| E7 | misprint | Appendix A.2, p.37, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found: U = S − D, and S carries the divisorial log structure O_S ∩ j_*O_U^× → O_S. |
| E8 | error | §1.3.15, p.20: Require an actual ordinary class, or assume G/Q_p quasi-split. A greatest admissible class need not attain the Hodge average. |
| E9 | gap | Corollary 1.3.13 proof, p.19: Use the actual Tannakian group H⊂G_s0, restriction of representations and descent of all required invariant morphisms. Evaluation followed by forgetting Frobenius gives a Vec_L-valued fibre functor; F-Isoc(s0) itself remains Q_p-linear. |
| E10 | misprint | §2.1.3, p.21, compared with Lemma 2.1.4 proof p.22: Use I_s0(Q) in the intersection with the prime-to-p integral automorphism group. |
| E11 | misprint | Corollary 1.3.13 proof, p.19: For V_m,n=V^⊗n⊗V*^⊗m, its image is D^⊗n⊗D*^⊗m. |
| E12 | misprint | Proposition 2.3.11 proof, p.34: Choose the crystalline cocharacter λ_T in {μ_X^{-1}}_p with Nλ_T=ν_δ. The corresponding Hodge cocharacter is λ_T^{-1}; use it for the special pair. |

## Library and ownership boundary

Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 27 inherited declaration records retain checked file hashes and exact statement slices. The rank-one theorem `WittVector.isocrystal_classification` was freshly read with its `finrank = 1` hypothesis. No higher-rank classification is claimed in Mathlib. Existing Witt, isocrystal, reductive/torus, character/cocharacter, dominant-chamber, abelian-variety and divided-power carriers are reused.

Fresh BG0/BG1 audit rows distinguish the rank-one carrier from unbuilt B(G), Newton maps and inner descent; VB0 owns the general slope decomposition and cyclic-algebra interfaces. The new concrete adapters become sources within those existing directions. The rational coroot cone remains distinct from an integral positive-root cone, and the central direction must be kept in reductive root-data comparisons.

The current Smith extraction routes its finite-field Honda–Tate material to R28.4. That owner and its reviewed audit were read. Accordingly T27 is now an explicit finite-field source contract at the same Tate-isogeny layer. Its number-field proof does not prove the finite-field or crystalline statement: Tate66 and the original crystalline source remain G-tate. The obsolete duplicate finite-field Part II proposal is removed.

### BunGAndNewtonStrata

BG0 already owns B(G), sigma-centralizers and inner Levis, and BG1 owns kappa, Newton classes and their order. Add KMPS local specialness, minuscule Levi and torus-transfer source lemmas here. Reuse existing root and torus declarations; do not create another roadmap for B(G). The false normalizer display and general inner-form transfer are required source gates. The ordinary-class adapter and explicit quaternion obstruction refine the existing inner-twist, invariant and basic-division-algebra tests; no competing B(G) owner is created.

### ReductiveGroupsArithmeticPartII

Extend Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), importing its group, torus, root-data and representation APIs. Import local fixers from Reductive groups, Part II (ReductiveGroupsPartII), finite adelic torus class number from Adelic algebraic groups (AdelicAlgebraicGroups AA.3), and local Newton/tori inputs from Reductive bundles, B(G) and Newton strata (BunGAndNewtonStrata BG0–BG1). Prove that ker(H1(Q,T) to H1(Q_p,T)) surjects onto H1(R,T), finite-place approximation for maximal tori, the required local and global transfer statements, and the simply connected/abelianized H1 reduction used for rational CM lifts. Construct Serre-condition tori, prime-units, Weil points, neat cyclic closures, Conj and the specified type-D quotient Conj prime. Prove density of neat prime-Weil points for a split auxiliary prime and the corrected reduced separated dense-point automorphism lemma. General finite-field Hom and Rosati theory are imported, not rebuilt. Preserve G-global and G-noot as exact original-proof acquisition tasks; do not assert a Hasse principle for every torus.

The upstream roadmap builds algebraic group structure and root data; the existing ReductiveGroupsPartII covers local topology, buildings, parahorics and the dual group. Neither states this global torus-transfer, H1-obstruction and Weil-point chain. Keep this arithmetic continuation distinct from the existing local continuation.

### ShimuraVarietiesHondaTatePartII

Build on Complex Shimura varieties and canonical models (ShimuraVarieties V4–V8), Shimura data (ShimuraData D3–D5), Siegel and PEL moduli problems (PELModuli M1–M4), Abelian schemes and arithmetic moduli (AbelianSchemesAndArithmeticModuli), AutomorphicBundles B1, finite-flat Dieudonne theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2), and PadicHodgeTheory R06.5. Import BunGAndNewtonStrata local theory, ReductiveGroupsArithmeticPartII global transfer, and CrystallineCohomologyConvergentPartII coefficient descent. Normalize the closure of the Hodge-type generic model at the lattice-stabilizer level. Construct lift-independent crystalline tensors, the family G-isocrystal and nonempty locally closed Newton strata for admissible classes satisfying (1.1.3.1); prove the lower Newton closure inclusion. State mu-ordinary nonemptiness with existence and rational-Newton witness, and density with local integrality. Prove the all-primes automorphism comparison, then independence of neat Weil conjugacy and rational maximal-torus transfer. For G quasi-split at p with no adjoint type-D factor, and explicitly assuming Conjecture 2.3.4 for all pairs, prove geometric coefficient-isogeny CM lifts for every point and every maximal torus of its isogeny group. Prove this unconditionally for PEL A/C. With G_der simply connected and ker1(Q,G_ab)=0 prove rational coefficient-isogeny CM lifts; specialize to C and A_n with n odd, retaining the separate odd-degree unitary argument. Preserve polarization similitudes, distinguish Qbar coefficient torsors from Q-points, and leave the disconnected type-D variant behind its exercise-proof gate. Do not generalize the motivic remarks to a proved abelian-type theorem. Import C02/C07–C10 from BG1: quasi-split ordinary existence is proved by the torus average; arbitrary inner-form existence is false. Keep geometric density conditional on its actual class and component hypotheses. Preserve N29 and T23 repairs from cc-fb70e5.

ShimuraVarieties V4–V8 constructs generic canonical models and CM theory, and PELModuli owns PEL integral moduli. The arbitrary allowed-prime Hodge-type normal model, tensor groups and all-maximal-torus CM lifts go beyond those scopes. The fixed split unitary good-prime Igusa application does not supply the general theorem.

### CrystallineCohomologyConvergentPartII

Extend Crystalline cohomology, de Rham–Witt and logarithmic foundations (CrystallineCohomology), importing CR.1, CR.5 and the coefficient interface CR.7. Reuse Witt vectors and DividedPowers, finite-flat Dieudonne modules (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2), semistable abelian models (NeronModelsAndSemistableAbelianVarieties R11.3), and the precise comparison supplier of PadicHodgeTheory. Define log enlargements, convergent log F-isocrystals, log Dieudonne crystals and their rationalization. Prove the reduced-enlargement and p-adically closed-ideal comparisons. For flat normal finite-type S/W, a relative Cartier boundary D, U=S minus D and an abelian scheme on U extending semi-abelianly to S, prove the Appendix A tensor-section extension: a global etale tensor section induces a unique convergent crystalline tensor section matching all permitted integral-point crystalline evaluations. Cover the proper semistable case first using the Eisenstein PD enlargement system, then the general case through alterations, proper descent and pointwise faithfulness. Keep horizontal and vertical log structures distinct. Import existing generic alterations/descent suppliers wherever exact contracts exist; specialize them here rather than re-planning their foundations. Close G-crystal before claiming the singular-base tensor construction complete.

CR.1 and CR.5 own crystalline/log foundations; CR.7 explicitly requires separate extensions for singular or nonproper coefficient settings. Appendix A supplies exactly such an extension. RD.3 overconvergent objects and RD.5 rigid-cohomological descent are different contracts, so neither is silently substituted.

### AbelianSchemesAndArithmeticModuli

A6 owns finite-dimensional rational Hom/End and Rosati positivity. Its reusable API should include the unit group, rational coefficient Isom open locus, real polarization-isometry compactness, and the unpolarized endomorphism-compatible rational-point argument. These are generic suppliers used by KMPS, not Shimura-specific definitions.

### FaltingsFinitenessAndIsogenyTheorems

For abelian varieties over a finite field, prove Hom⊗Q_ell equals Frobenius-equivariant rational Tate-module Hom for ell≠p and the contravariant crystalline analogue for ell=p. Treat sufficiently divisible finite extension for geometric Hom, functorial composition, duality and invertible loci. Import Hom/End from AbelianSchemesAndArithmeticModuli A6 and Dieudonne realization from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2. Close G-tate with Tate66 and the original crystalline source.

The current PAPER-SMITH-24 extraction already routes finite-field Honda–Tate to the Tate-isogeny layer R28.4. Its existing README supplies the generic rational Hom comparison and keeps the Hom-side algebra in AbelianSchemes A6. Add this finite-field source contract there, explicitly separating it from the number-field proof; no duplicate finite-field Part II is proposed. This routing does not claim the current number-field roadmap proves the finite-field or crystalline theorem.

## Remaining gates and resume order

- **G-source**: Collate final Duke text with E1–E12. N29 absolute-Weyl and T23 fibre-product repairs are integrated and preserved; the local inner-form existence claim has the explicit counterexample C03–C09. Final publisher request still returned HTML.
- **G-local**: Resolve N27–N29 unramified minuscule input, central-quotient and torsion-free kernel; read the K2 rational-conjugacy lemma used in Kot85 Proposition 6.2. Refine BG1 torus proof suppliers and bounded-Newton finiteness used for S16 openness. C03–C09 give the explicit quaternion calculation, but generic slope/decency and local-field interfaces still require implementation.
- **G-global**: Acquire the local-global torus obstruction sequence with its real-place convention, local transfer, weak approximation for the variety of maximal tori, simply connected local/global vanishing, and Borovoi reduction. Verify Langlands–Rapoport Lemma 5.6 and the PEL/odd-degree unitary Hasse inputs.
- **G-model**: Read the original normal integral-model, connectedness/compactification, building-embedding and special-parahoric sources. Pin the lattice/full-fixer versus connected-parahoric conditions. Prove the potential-good-reduction extension lemma with its rigidifying level.
- **G-tensors**: Read Deligne absolute Hodge, Berthelot–Ogus parallel transport, Wintenberger admissibility, and the Tannakian extension in Corollary 1.3.13. Prove an exact faithful tensor functor without identifying a possibly proper monodromy group with the full chosen tensor stabilizer. S11 now spells out the restriction-to-monodromy and idempotent descent obligations; E9 records the failed printed category identification.
- **G-crystal**: Read and split the original log Dieudonne construction, Faltings associated-coefficient comparison, semistable alterations, proper descent and pointwise faithfulness. Reconcile divisorial log structures and the p-adically closed enlargement ideal. Construct the singular/nonproper coefficient extension, not only its smooth point fibers.
- **G-tate**: Read Tate66 and the crystalline comparison original proof, with the finite-extension stabilization of geometric Hom. Prove Rosati compactness and the invertible-locus comparison; separate endomorphism tensors from polarization similitudes.
- **G-noot**: Acquire Noo09 Theorems 1.8, 2.4, 4.2, Lemmas 2.5–2.6, Proposition 3.2 and the Noo06 factor-polynomial argument. Verify the accommodating definition against its original wording, and preserve the proved fibre-product kernel factorization in T23 while checking its upstream inputs. Track the type-D outer action through the characteristic-p realization.
- **G-conjecture**: Keep Conjecture 2.3.4 as an explicit hypothesis for general Hodge type. T16 proves its diagonal automorphism case; T31 proves the PEL A/C case. A complete extraction must preserve that boundary, not solve or assume away the conjecture.
- **G-ordinary**: Do not seek a proof of arbitrary inner-form ordinary existence. Audit final-version wording and the model hypotheses of S17/S19 under G-source/G-model.
- **G-typeD**: Prove the exercise of Remark 2.3.16(2) using the full disconnected tensor stabilizer. The comparison between its conjugacy classes and Conj prime is required. Do not transfer the result unchanged to the connected G-torsor definition.

Completion still requires original-source closure, finer generic supplier nodes and grouped-definition splitting. G-ordinary records a resolved algebraic scope distinction, not an unresolved promise to prove false inner-form existence. The separate G-model scope is open. Conjecture 2.3.4 is an intentional hypothesis rather than a missing unconditional theorem.

## Item index

| ID | Kind/status | Name | Owner or library |
| --- | --- | --- | --- |
| L01 | definition/library | Witt-vector coefficient carrier | mathlib:WittVector |
| L02 | construction/library | Frobenius on the Witt fraction field | mathlib:WittVector.FractionRing.frobenius |
| L03 | definition/library | Point-valued isocrystal | mathlib:WittVector.Isocrystal |
| L04 | definition/library | Morphism of point-valued isocrystals | mathlib:WittVector.IsocrystalHom, mathlib:WittVector.IsocrystalEquiv |
| L05 | theorem/library | Rank-one isocrystal classification | mathlib:WittVector.isocrystal_classification, mathlib:WittVector.StandardOneDimIsocrystal.frobenius_apply |
| L06 | definition/library | Connected reductive group predicate | tauceti:TauCeti.reductiveCommHopfAlgProperty, tauceti:TauCeti.reductiveCommHopfAlgProperty_iff |
| L07 | definition/library | Algebraic torus predicate | tauceti:TauCeti.torusCommHopfAlgProperty, tauceti:TauCeti.torusCommHopfAlgProperty_iff |
| L08 | definition/library | Geometric character lattice | tauceti:TauCeti.CommHopfAlgCat.additiveCharacterGroup, tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup |
| L09 | definition/library | Cocharacter lattice and pairing | tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLattice, tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLatticeLinearEquivDual, tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing |
| L10 | theorem/library | Perfect character-cocharacter pairing | tauceti:TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair |
| L11 | definition/library | Closed dominant chamber of a root pairing | tauceti:TauCeti.dominantChamber, tauceti:TauCeti.mem_dominantChamber |
| L12 | theorem/library | Unique dominant representative in a Weyl orbit | tauceti:TauCeti.existsUnique_mem_orbit_inter_dominantChamber |
| L13 | definition/library | Abelian variety over a field | tauceti:TauCeti.AlgebraicGeometry.AbelianVariety |
| L14 | definition/library | Geometric isogeny | tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny, tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.isIsogeny_iff |
| L15 | definition/library | Divided-power structure | mathlib:DividedPowers |
| P01 | definition/planned | Shimura datum and Hodge-type embedding | ShimuraData:D4 |
| P02 | construction/planned | Hodge cocharacter and reflex field | ShimuraData:D3 |
| P03 | construction/planned | Generic canonical Shimura tower | ShimuraVarieties:V6 ShimuraVarieties:V8 |
| P04 | construction/planned | Siegel prime-to-p isogeny moduli | PELModuli:M1 PELModuli:M2 PELModuli:M4 |
| P05 | construction/planned | Absolute Hodge tensor realizations | AutomorphicBundles:B1 |
| P06 | construction/planned | Abelian Dieudonne realization | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 |
| P07 | theorem/planned | Dieudonne-Manin classification beyond rank one | VectorBundlesAndIsocrystals:VB0 |
| P08 | theorem/planned | Good-reduction crystalline comparison | PadicHodgeTheory:R06.5 |
| P09 | theorem/planned | Finite generation of abelian Hom | AbelianSchemesAndArithmeticModuli:A6 |
| P10 | theorem/planned | CM abelian varieties have potentially good reduction | ShimuraVarieties:V5 |
| P11 | theorem/planned | Finite adelic torus class number | AdelicAlgebraicGroups:AA.3 |
| P12 | construction/planned | Bruhat-Tits lattice-stabilizer interface | ReductiveGroupsPartII:RG2.2 ReductiveGroupsPartII:RG2.3 |
| P13 | definition/planned | Log structure and log crystalline site | CrystallineCohomology:CR.5 |
| P14 | theorem/planned | Abelian Serre-Tate deformation | AbelianSchemesAndArithmeticModuli:A4 |
| N01 | definition/missing | Rational slope protorus | BunGAndNewtonStrata |
| N02 | definition/planned | Algebraic fundamental group | BunGAndNewtonStrata:BG1 |
| N03 | definition/planned | Galois-invariant Newton orbit space | BunGAndNewtonStrata:BG1 |
| N04 | definition/missing | Newton dominance relation | BunGAndNewtonStrata |
| N05 | theorem/missing | Rational cone and integral-cone adapter | BunGAndNewtonStrata |
| N06 | definition/planned | Sigma-conjugacy set | BunGAndNewtonStrata:BG0 |
| N07 | construction/planned | Kottwitz invariant | BunGAndNewtonStrata:BG1 |
| N08 | construction/planned | Newton cocharacter | BunGAndNewtonStrata:BG1 |
| N09 | theorem/missing | Corrected decency identity | BunGAndNewtonStrata |
| N10 | theorem/planned | Kottwitz-Newton compatibility | BunGAndNewtonStrata:BG1 |
| N11 | theorem/planned | Classification by both invariants | BunGAndNewtonStrata:BG1 |
| N12 | definition/planned | Basic class | BunGAndNewtonStrata:BG1 |
| N13 | theorem/planned | Classification of basic classes | BunGAndNewtonStrata:BG1 |
| N14 | theorem/planned | Torus norm representative | BunGAndNewtonStrata:BG1 |
| N15 | definition/missing | Rational Newton representative condition | BunGAndNewtonStrata |
| N16 | theorem/missing | Sufficient conditions for rational Newton representative | BunGAndNewtonStrata |
| N17 | definition/planned | Sigma-centralizer group | BunGAndNewtonStrata:BG0 |
| N18 | theorem/planned | Sigma-centralizer and inner Levi | BunGAndNewtonStrata:BG0 |
| N19 | construction/missing | Galois average of a dominant Hodge cocharacter | BunGAndNewtonStrata |
| N20 | definition/missing | Admissible pair and B(G,mu) | BunGAndNewtonStrata |
| N21 | theorem/missing | Basic class attached to a Hodge cocharacter is admissible | BunGAndNewtonStrata |
| N22 | definition/missing | Torus-special admissible pair | BunGAndNewtonStrata |
| N23 | theorem/missing | Elliptic torus supplies a basic admissible pair | BunGAndNewtonStrata |
| N24 | theorem/missing | Unramified replacement preserving Galois averages | BunGAndNewtonStrata |
| N25 | theorem/missing | D4 triality orbit replacement | BunGAndNewtonStrata |
| N26 | theorem/missing | Levi basic Newton formula | BunGAndNewtonStrata |
| N27 | theorem/missing | Quasi-split minuscule Levi lift | BunGAndNewtonStrata |
| N28 | theorem/missing | Torsion-free kernel in Levi coinvariants | BunGAndNewtonStrata |
| N29 | theorem/missing | General rational-Levi minuscule lift (corrected: absolute Weyl group) | BunGAndNewtonStrata |
| N30 | definition/missing | Transfer of a maximal torus of J_b | BunGAndNewtonStrata |
| N31 | theorem/missing | Existence of local torus transfer in the stated cases | BunGAndNewtonStrata |
| N32 | theorem/missing | Specialness for a transferred maximal torus | BunGAndNewtonStrata |
| G01 | theorem/missing | Prescribed real torus torsor trivial at p | ReductiveGroupsArithmeticPartII |
| G02 | theorem/missing | Local-global torus cohomology obstruction sequence | ReductiveGroupsArithmeticPartII |
| G03 | theorem/missing | Auxiliary prime matching complex-conjugation action | ReductiveGroupsArithmeticPartII |
| G04 | theorem/missing | Approximation of maximal tori at finitely many places | ReductiveGroupsArithmeticPartII |
| G05 | theorem/missing | Simply connected local cohomology vanishing | ReductiveGroupsArithmeticPartII |
| G06 | theorem/missing | Steinberg torsor triviality over L | ReductiveGroupsArithmeticPartII |
| G07 | theorem/missing | Real Weyl action and torus cocycle | ReductiveGroupsArithmeticPartII |
| G08 | theorem/missing | Special Shimura pair with prescribed Newton class | ShimuraVarietiesHondaTatePartII |
| G09 | definition/missing | Serre condition for a rational torus | ReductiveGroupsArithmeticPartII |
| G10 | definition/missing | Prime-unit in an algebraic group | ReductiveGroupsArithmeticPartII |
| G11 | definition/missing | Weil number and Weil point | ReductiveGroupsArithmeticPartII |
| G12 | theorem/missing | Representation independence of Weil points | ReductiveGroupsArithmeticPartII |
| G13 | theorem/missing | Serre condition converts units to Weil points | ReductiveGroupsArithmeticPartII |
| G14 | definition/missing | Neat semisimple point | ReductiveGroupsArithmeticPartII |
| G15 | theorem/missing | Zariski density of neat Weil points | ReductiveGroupsArithmeticPartII |
| G16 | theorem/missing | Corrected finite-automorphism comparison on dense points | ReductiveGroupsArithmeticPartII |
| G17 | theorem/missing | Global transfer of maximal tori between inner forms | ReductiveGroupsArithmeticPartII |
| G18 | theorem/missing | Simply connected derived group and abelianized obstruction | ReductiveGroupsArithmeticPartII |
| G19 | definition/missing | Hasse obstruction for the abelian quotient | ReductiveGroupsArithmeticPartII |
| G20 | theorem/planned | Simply connected derived PEL group | PELModuli:M3 |
| S01 | construction/missing | Normal integral Hodge-type model | ShimuraVarietiesHondaTatePartII |
| S02 | theorem/missing | Extension over a mixed-characteristic DVR | ShimuraVarietiesHondaTatePartII |
| S03 | theorem/missing | Independence of crystalline tensors from a lift | ShimuraVarietiesHondaTatePartII |
| S04 | theorem/missing | Gauss-Manin transport in the formal neighborhood | ShimuraVarietiesHondaTatePartII |
| S05 | construction/missing | Newton class of a mod-p point | ShimuraVarietiesHondaTatePartII |
| S06 | theorem/missing | Admissibility of the point's Newton class | ShimuraVarietiesHondaTatePartII |
| S07 | theorem/missing | Nonemptiness by special-point reduction | ShimuraVarietiesHondaTatePartII |
| S08 | construction/missing | Integral zero-dimensional torus model | ShimuraVarietiesHondaTatePartII |
| S09 | definition/missing | Family isocrystal with G-structure | CrystallineCohomologyConvergentPartII |
| S10 | theorem/missing | Global crystalline tensor sections | CrystallineCohomologyConvergentPartII |
| S11 | theorem/missing | Tensor functor for the universal crystalline realization | ShimuraVarietiesHondaTatePartII |
| S12 | theorem/missing | Closed lower Newton locus | ShimuraVarietiesHondaTatePartII |
| S13 | theorem/missing | Nonempty locally closed Newton strata | ShimuraVarietiesHondaTatePartII |
| S14 | theorem/missing | Newton closure inclusion | ShimuraVarietiesHondaTatePartII |
| S15 | definition/missing | Mu-ordinary locus from an actual ordinary class | ShimuraVarietiesHondaTatePartII |
| S16 | theorem/missing | Openness and nonemptiness of the mu-ordinary stratum | ShimuraVarietiesHondaTatePartII |
| S17 | theorem/missing | Density under local integrality | ShimuraVarietiesHondaTatePartII |
| S18 | theorem/missing | Hyperspecial density specialization | ShimuraVarietiesHondaTatePartII |
| S19 | theorem/missing | Tame special-parahoric density specialization | ShimuraVarietiesHondaTatePartII |
| S20 | construction/missing | Prime-to-p integral tower | ShimuraVarietiesHondaTatePartII |
| S21 | theorem/missing | Extension of prime-to-p tensor sections | ShimuraVarietiesHondaTatePartII |
| T01 | construction/missing | Rational quasi-endomorphism group | AbelianSchemesAndArithmeticModuli |
| T02 | definition/missing | Polarization similitude character | ShimuraVarietiesHondaTatePartII |
| T03 | definition/missing | Global tensor-preserving quasi-isogeny group | ShimuraVarietiesHondaTatePartII |
| T04 | theorem/missing | Compact-mod-scalars structure | ShimuraVarietiesHondaTatePartII |
| T05 | definition/missing | Prime-to-p integral automorphism subgroup | ShimuraVarietiesHondaTatePartII |
| T06 | theorem/missing | Hecke orbit injects into the quasi-isogeny quotient relation | ShimuraVarietiesHondaTatePartII |
| T07 | construction/missing | Frobenius quasi-isogeny and compatible powers | ShimuraVarietiesHondaTatePartII |
| T08 | definition/missing | Stable ell-adic Frobenius centralizer | ShimuraVarietiesHondaTatePartII |
| T09 | theorem/missing | Split auxiliary-prime comparison | ShimuraVarietiesHondaTatePartII |
| T10 | theorem/missing | Finiteness-to-group comparison argument | ShimuraVarietiesHondaTatePartII |
| T11 | construction/missing | Finite-field crystalline descent and Frobenius norm | ShimuraVarietiesHondaTatePartII |
| T12 | definition/missing | Crystalline stable centralizer | ShimuraVarietiesHondaTatePartII |
| T13 | definition/missing | Semisimple conjugacy quotient | ReductiveGroupsArithmeticPartII |
| T14 | construction/missing | Type-D adjusted conjugacy quotient | ReductiveGroupsArithmeticPartII |
| T15 | theorem/missing | Noot independence of Frobenius conjugacy class | ShimuraVarietiesHondaTatePartII |
| T16 | theorem/missing | Tate theorem for automorphisms with tensors at every prime | ShimuraVarietiesHondaTatePartII |
| T17 | theorem/missing | Common weight of a Weil quasi-endomorphism | ShimuraVarietiesHondaTatePartII |
| T18 | definition/missing | Admissible classical representation for Noot's argument | ShimuraVarietiesHondaTatePartII |
| T19 | definition/missing | Accommodating symplectic embedding | ShimuraVarietiesHondaTatePartII |
| T20 | theorem/missing | Conjugacy independence for neat Weil points | ShimuraVarietiesHondaTatePartII |
| T21 | theorem/missing | Accommodating-case character-polynomial argument | ShimuraVarietiesHondaTatePartII |
| T22 | construction/missing | Auxiliary accommodating Shimura correspondence | ShimuraVarietiesHondaTatePartII |
| T23 | theorem/missing | Rational abelian-quotient map | ShimuraVarietiesHondaTatePartII |
| T24 | theorem/missing | Conjugacy of realization embeddings | ShimuraVarietiesHondaTatePartII |
| T25 | theorem/missing | Rational transfer of a maximal isogeny torus | ShimuraVarietiesHondaTatePartII |
| T26 | construction/missing | Rational isogeny Isom scheme | AbelianSchemesAndArithmeticModuli |
| T27 | theorem/missing | Classical Tate isogeny comparison | FaltingsFinitenessAndIsogenyTheorems |
| T28 | definition/missing | Tensor-preserving isogeny torsors | ShimuraVarietiesHondaTatePartII |
| T29 | definition/missing | Tate-with-tensors comparison hypothesis | ShimuraVarietiesHondaTatePartII |
| T30 | theorem/missing | Independence from a generating tensor family | ShimuraVarietiesHondaTatePartII |
| T31 | theorem/missing | Tate-with-tensors for PEL A and C | ShimuraVarietiesHondaTatePartII |
| T32 | definition/missing | Geometric versus rational coefficient isogeny | ShimuraVarietiesHondaTatePartII |
| T33 | definition/missing | CM lift with respect to a maximal torus | ShimuraVarietiesHondaTatePartII |
| T34 | theorem/missing | Special-torus Frobenius is a prime-unit | ShimuraVarietiesHondaTatePartII |
| T35 | theorem/missing | Uniqueness of special torus Frobenius up to finite order | ShimuraVarietiesHondaTatePartII |
| T36 | theorem/missing | Conditional geometric CM lift | ShimuraVarietiesHondaTatePartII |
| T37 | construction/missing | Torus reduction of the isogeny torsor | ShimuraVarietiesHondaTatePartII |
| T38 | theorem/missing | Rational CM lift from a Hasse principle | ShimuraVarietiesHondaTatePartII |
| T39 | theorem/missing | PEL geometric CM lifts | ShimuraVarietiesHondaTatePartII |
| T40 | theorem/missing | PEL rational CM lifts in the stated cases | ShimuraVarietiesHondaTatePartII |
| T41 | theorem/missing | Type-D disconnected-group variant | ShimuraVarietiesHondaTatePartII |
| T42 | theorem/missing | Unpolarized isogeny torsors split | AbelianSchemesAndArithmeticModuli |
| A01 | definition/missing | Formal logarithmic scheme over Witt vectors | CrystallineCohomologyConvergentPartII |
| A02 | definition/missing | Log enlargement | CrystallineCohomologyConvergentPartII |
| A03 | definition/missing | Convergent logarithmic F-isocrystal | CrystallineCohomologyConvergentPartII |
| A04 | theorem/missing | Enlargement comparison | CrystallineCohomologyConvergentPartII |
| A05 | definition/missing | Log Dieudonne crystal | CrystallineCohomologyConvergentPartII |
| A06 | theorem/missing | Log Dieudonne rationalization | CrystallineCohomologyConvergentPartII |
| A07 | construction/missing | Semi-abelian logarithmic realization | CrystallineCohomologyConvergentPartII |
| A08 | construction/missing | Vertical and horizontal log comparison | CrystallineCohomologyConvergentPartII |
| A09 | theorem/missing | Association of etale and logarithmic crystalline coefficients | CrystallineCohomologyConvergentPartII |
| A10 | construction/missing | Crystalline value of an etale tensor at an integral point | CrystallineCohomologyConvergentPartII |
| A11 | construction/missing | Eisenstein divided-power enlargement system | CrystallineCohomologyConvergentPartII |
| A12 | construction/missing | Semistable chart and horizontal enlargement | CrystallineCohomologyConvergentPartII |
| A13 | theorem/missing | Faltings invariant horizontal tensor lift | CrystallineCohomologyConvergentPartII |
| A14 | theorem/missing | Proper semistable extension of tensor sections | CrystallineCohomologyConvergentPartII |
| A15 | theorem/missing | Semistable alteration hypercover | CrystallineCohomologyConvergentPartII |
| A16 | theorem/missing | Unique global convergent tensor extension | CrystallineCohomologyConvergentPartII |
| L16 | theorem/library | Finite free cocharacter lattice | tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_free, tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_finite |
| L17 | theorem/library | Galois invariance of the pairing | tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing_galois_invariant |
| P15 | theorem/planned | Semisimple rational endomorphism algebra | AbelianSchemesAndArithmeticModuli:A6 |
| P16 | theorem/planned | Rosati positivity | AbelianSchemesAndArithmeticModuli:A6 |
| G21 | theorem/missing | Compact real polarization-isometry group | AbelianSchemesAndArithmeticModuli |
| G22 | theorem/missing | Hasse principle for simply connected semisimple groups | ReductiveGroupsArithmeticPartII |
| G23 | theorem/planned | PEL abelian quotient Hasse cases | PELModuli:M3 |
| G24 | theorem/missing | Odd-degree unitary Hasse case | ReductiveGroupsArithmeticPartII |
| T43 | theorem/missing | Odd-degree unitary rational CM lifts | ShimuraVarietiesHondaTatePartII |
| T44 | theorem/missing | Special-torus Frobenius Kottwitz formula | ShimuraVarietiesHondaTatePartII |
| A17 | theorem/missing | Proper descent for convergent isocrystals | CrystallineCohomologyConvergentPartII |
| A18 | theorem/missing | Detection of convergent morphisms at fibers | CrystallineCohomologyConvergentPartII |
| C01 | theorem/planned | Torus Newton invariant is the Galois average | BunGAndNewtonStrata:BG1 |
| C02 | theorem/missing | Ordinary class for a quasi-split group | BunGAndNewtonStrata |
| C03 | construction/missing | Quaternion division algebra and its split Frobenius model | BunGAndNewtonStrata |
| C04 | theorem/missing | Transport of twisted sigma-conjugacy by a quaternion matrix | BunGAndNewtonStrata |
| C05 | theorem/missing | Half-slope shift for the quaternion inner twist | BunGAndNewtonStrata |
| C06 | theorem/planned | Two distinct rank-two slopes are integral | VectorBundlesAndIsocrystals:VB0 |
| C07 | theorem/missing | Quaternion obstruction to an ordinary class | BunGAndNewtonStrata |
| C08 | theorem/missing | A unique maximal admissible class need not be ordinary | BunGAndNewtonStrata |
| C09 | theorem/missing | Rational cocharacters of a division algebra are central | BunGAndNewtonStrata |
| C10 | definition/missing | Ordinary Newton class with an explicit witness | BunGAndNewtonStrata |

## Executable continuation certificate

This standard-library Python checks exact quadratic-field matrices, the twisted conjugacy and even-norm identities, the κ shift, central twists in both Hodge signs, admissible monomial examples and the Laurent-idempotent sanity check. The general proofs above are not replaced by enumeration. It prints 2,942 successful assertions. API/unit tests remain specifications; no Lean file was compiled.

```python
from fractions import Fraction as Q
from itertools import product
checks=0
families={}
def ck(v,f):
 global checks
 assert v,f
 checks+=1;families[f]=families.get(f,0)+1
# Q(sqrt(2)), with conjugation modeling unramified Frobenius at p=3.
z=(Q(0),Q(0));one=(Q(1),Q(0))
def q(a,b=0):return Q(a),Q(b)
def add(a,b):return a[0]+b[0],a[1]+b[1]
def neg(a):return -a[0],-a[1]
def sub(a,b):return add(a,neg(b))
def mul(a,b):return a[0]*b[0]+2*a[1]*b[1],a[0]*b[1]+a[1]*b[0]
def conj(a):return a[0],-a[1]
def inv(a):
 n=a[0]*a[0]-2*a[1]*a[1];assert n
 return a[0]/n,-a[1]/n
def mm(a,b):return tuple(add(mul(a[2*i],b[j]),mul(a[2*i+1],b[2+j])) for i in range(2) for j in range(2))
def det(a):return sub(mul(a[0],a[3]),mul(a[1],a[2]))
def mi(a):
 u=inv(det(a));return tuple(mul(u,x) for x in (a[3],neg(a[1]),neg(a[2]),a[0]))
def scale(s,a):return tuple(mul(s,x) for x in a)
def sig(a):return tuple(conj(x) for x in a)
I=(one,z,z,one);J=(z,q(3),one,z);Ji=mi(J)
def sd(a):return mm(mm(J,sig(a)),Ji)
def norm(a,r,s):
 out=I
 for i in range(r):out=mm(out,a);a=s(a)
 return out
def diag(a,b):return a,z,z,b
for a,b in product(range(-3,4),repeat=2):
 x=q(a,b);A=diag(x,conj(x))
 ck(sd(A)==A,'descent-fixed-E')
ck(sd(J)==J and mm(J,J)==scale(q(3),I),'descent-fixed-J')
# Noncommuting, non-Frobenius-fixed invertible matrices.
mats=[]
for a,b in product(range(-2,3),repeat=2):
 M=(q(1,a),q(b,1),q(a,-1),q(2,b))
 if det(M)!=z:mats.append(M)
for b in mats:
 ck(sd(sd(b))==sig(sig(b)),'descent-square')
 for r in [2,4,6]:
  ck(norm(b,r,sd)==scale(q(Q(3)**(-r//2)),norm(mm(b,J),r,sig)),'even-norm-shift')
 for c in mats:
  lhs=mm(mm(mm(c,b),mi(sd(c))),J)
  rhs=mm(mm(c,mm(b,J)),mi(sig(c)))
  ck(lhs==rhs,'sigma-conjugacy-bijection')
# Division norm parity for nonzero a,b; arithmetic never treats p as a square.
def vp(x,p=3):
 assert x
 v=0;x=abs(x)
 while x.numerator%p==0:x/=p;v+=1
 while x.denominator%p==0:x*=p;v-=1
 return v
for a,b,c,e in product(range(-2,3),repeat=4):
 A=q(a,b);B=q(c,e)
 if A==B==z:continue
 na=mul(A,conj(A))[0];nb=mul(B,conj(B))[0]
 ck(na-3*nb!=0,'division-norm-nonzero')
 if na and nb:ck(vp(na)%2==0 and vp(3*nb)%2==1,'division-norm-parity')
# Half-slope normalization, including inverse Hodge and arbitrary central twist.
for m in range(-20,21):
 mu=(Q(m+1),Q(m));basic=(Q(m)+Q(1,2),)*2
 b=scale(q(Q(3)**m),J)
 ck(mm(b,J)==scale(q(Q(3)**(m+1)),I),'basic-representative')
 ck(vp(det(b)[0])==2*m+1,'kappa-shift')
 target=tuple(x+Q(1,2) for x in mu)
 ck(target[0]!=target[1] and all(x.denominator==2 for x in target),'ordinary-obstruction')
 ck(sum(mu)==sum(basic) and mu[0]-basic[0]==Q(1,2),'basic-admissible')
 # Exhaust every integer pair satisfying the exact sum and bounded dominance.
 # The general argument is in the report; this is only a bounded regression.
 for a in range(m-8,m+9):
  c=2*m+2-a
  if a>=c and a<=m+Q(3,2):ck(a==c==m+1,'singleton-bound')
# All monomial split matrices with exponents in [-8,8].
for a,c,anti in product(range(-8,9),range(-8,9),[False,True]):
 slopes=(Q(a+c,2),)*2 if anti else tuple(sorted((Q(a),Q(c)),reverse=True))
 nu=tuple(x-Q(1,2) for x in slopes);kap=a+c-1
 ck(sum(nu)==kap,'monomial-kappa-newton')
 if kap%2:
  m=(kap-1)//2
  if nu[0]<=m+1:ck(nu==(Q(m)+Q(1,2),)*2,'monomial-admissible-singleton')
# Rational descent cocharacter obstruction: Laurent coefficients are orthogonal idempotents.
# Exhaust supports in F5; division-ring proof itself is symbolic in C09.
for coeff in product(range(5),repeat=4):
 ok=sum(coeff)%5==1 and all((x*x-x)%5==0 for x in coeff) and all(coeff[i]*coeff[j]%5==0 for i in range(4) for j in range(4) if i!=j)
 if ok:ck(sorted(coeff)==[0,0,0,1],'cocharacter-idempotents')
# Constant unit Tannakian example: tensor automorphism fixes 1; GL1 stabilizer larger.
ck(Q(2)!=Q(1),'proper-monodromy-not-G')
# Mixed tensor convention and inverse Hodge signs.
for m,n in product(range(4),repeat=2):
 ck(n-m==-(m-n),'mixed-tensor-weight')
ck(Q(1)!=-Q(1),'inverse-Hodge-sign')
result={'method':'Exact rational quadratic-field and matrix arithmetic; finite regressions supplement the symbolic proofs and are not Lean verification.','count':checks,'families':families}

import json
print(json.dumps(result,sort_keys=True))
```

## Preserved exact acceptance families

The earlier eight families were also rerun: decency factor count, Hodge inverse, GL3 normalizer, D4 averaging, integral torsion, rational cone orientation, nonreduced dense points, and divisible Frobenius powers.

```python
from fractions import Fraction as Q
from itertools import permutations, product
import json
from pathlib import Path
checks=[]
def passed(name,meaning):checks.append(dict(name=name,result='pass',meaning=meaning))
# Source equation (1.1.2.2): b=p in G_m is fixed by sigma.
for p,r in product([2,3,5],range(1,9)):
    assert p**r != p**(r+1)
passed('Decency factor count','The r-factor norm has valuation r; the displayed r+1-factor product does not.')
assert Q(3)**1 != Q(3)**(-1)
passed('Inverse Hodge sign','The two proposed torus classes already differ for exponent one in G_m.')
# Corollary 1.1.15: normalizer of the (1,2) block Levi in GL3.
mu=(0,1,0); newton=(1,0,0); block=[frozenset([0]),frozenset([1,2])]
perms=list(permutations(range(3)))
def act(w,x):return tuple(x[w[i]] for i in range(3))
def kappaM(x):return (x[0],x[1]+x[2])
normalizer=[w for w in perms if {frozenset(w[i] for i in B) for B in block}==set(block)]
weylM=[w for w in perms if all(frozenset(w[i] for i in B)==B for B in block)]
assert normalizer==weylM and len(normalizer)==2
assert sorted(mu)==sorted(newton) and sum(mu)==sum(newton)==1
assert kappaM(newton)==(1,0)
assert all(kappaM(act(w,mu))==(0,1) for w in normalizer)
assert any(kappaM(act(w,mu))==(1,0) for w in perms if w not in normalizer)
passed('GL3 Levi normalizer counterexample','The relative normalizer quotient is trivial; full Weyl conjugacy, unlike this normalizer, can move the slope-one coordinate.')
# D4 diagram action: index 0 is the central vertex.
S3=[(0,)+(tuple(i+1 for i in w)) for w in permutations(range(3))]
C3=[(0,1,2,3),(0,2,3,1),(0,3,1,2)]
def avg(group,x):return tuple(sum((Q(x[w[i]]) for w in group),Q(0))/len(group) for i in range(len(x)))
for j in range(4):
    x=tuple(int(i==j) for i in range(4));assert avg(S3,x)==avg(C3,x)
passed('D4 orbit averaging','S3 and its C3 subgroup have the same averaging operator on diagram coordinates; their actions are not equal.')
for x in product(range(-2,3),repeat=2):
    y=avg([(0,1),(1,0)],x);assert avg([(0,1),(1,0)],y)==y
assert (Q(1)+Q(-1))/2==0 and 1%2!=0%2
passed('Averaging and integral torsion','Averaging is idempotent but loses the nontrivial Z/2 coinvariant of the sign action.')
ordinary=(Q(0),Q(1)); basic=(Q(1,2),Q(1,2))
assert sum(ordinary)==sum(basic) and basic[0]>=ordinary[0]
assert (ordinary[1]-basic[1])==Q(1,2) and Q(1,2).denominator!=1
passed('Newton order and rational cone','The basic increasing-slope polygon lies above the ordinary one; the dominant difference needs a half-coroot, outside the integral cone.')
# Reducedness in Lemma 2.2.11: Spec(F5[e]/e²).
elements=list(product(range(5),repeat=2))
def add(x,y):return tuple((a+b)%5 for a,b in zip(x,y))
def mul(x,y):return ((x[0]*y[0])%5,(x[0]*y[1]+x[1]*y[0])%5)
def f(x):return (x[0],2*x[1]%5)
assert len({f(x) for x in elements})==25
assert f((0,1))!=(0,1) and f((1,0))==(1,0)
for x,y in product(elements,repeat=2):
    assert f(add(x,y))==add(f(x),f(y)) and f(mul(x,y))==mul(f(x),f(y))
assert [a for a in range(5) if a*a%5==0]==[0]
passed('Nonreduced dense-point counterexample','A nonidentity algebra automorphism fixes the unique F5-point, which is dense in the one-point spectrum.')
# Commutation with diag(1,-1) is stricter than with its square.
def mm(a,b):return tuple(sum(a[2*i+k]*b[2*k+j] for k in range(2)) for i in range(2) for j in range(2))
d=(1,0,0,-1); u=(1,1,0,1)
assert mm(d,u)!=mm(u,d) and mm(mm(d,d),u)==mm(u,mm(d,d))
passed('Divisible Frobenius powers','Even and odd powers have different centralizers; sufficiently divisible cannot be replaced by sufficiently large.')
result=dict(method='Exact Python integer and Fraction arithmetic; mathematical acceptance checks, not Lean verification.',checks=checks,count=len(checks))

print(json.dumps(result,sort_keys=True))
```
