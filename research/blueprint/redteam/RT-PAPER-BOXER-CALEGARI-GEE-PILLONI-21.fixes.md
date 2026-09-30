# RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5016, job FIX-RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21).

- **Findings:** `RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json`.
- **Verdicts:** `RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21.review.json` and `reviews/REV-RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21.md` (verifier `cc-48533a`). All twenty-four findings are confirmed: two high (/1, /8), fifteen medium (/2–/7, /9–/17) and seven low (/18–/24).
- **What this job fixes:** the high and medium findings, /1–/17, as the issue lists them.
  - Where the verifier's reason differs from the red team's fix text, I followed the reason. It sets the scope of each fix.
  - The low findings are recorded below and not applied (PROTOCOL §17).
- **Disclosure.**
  - This session (`cc-f805bf`) wrote the red team RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21 (PR #4750). Its finding /12 touched this session's proposal R28.7 in FIX-RT-AREA-iwasawa-1.
  - This session also wrote FIX-RT-AREA-automorphic-1 and the red teams of Kisin–Wortmann 2009 and BHKT.
  - It did not write this extraction, its review or the verification.
  - The fix follows only the scope that the independent verifier authorised. Where the verifier narrowed, amended or rejected parts of my own red-team fixes (/1, /2, /3, /4, /6, /7, /8, /9, /10, /11, /12, /13, /14, /15, /16, /17), I applied its version, as each section says.
- **Files changed. Only the deliverables:**
  - `papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json`;
  - `papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.md`: the count line, the route table, two lines of the planned-items list, the source-issue counts, the list of affected stated results, and a closing section "Fixes after the red team";
  - this report.

  `make_queue.py`, `queue.json`, the review files, the packets and the other papers are not deliverables. Every change a finding asks of them is listed under "For the maintainer".
- **Result.** 334 items (3 library, 33 planned, 298 missing), 34 routes, 163 source issues, 19 prerequisites.
  - New items /333–/336. Items /264 and /265 are merged into /144 and /259 and removed, so the item ids now skip 264 and 265.
  - New source issues E160–E163. E137's correction and reason, and E140's reason, are amended with dated sentences. No other record changed.
  - Route sizes: route 1 20 (was 19); route 2 85 (was 86); route 8 9 (was 8); route 13 3 (was 4); route 20 1 (was 2); route 23 2 (was 1); route 25 2 (was 1); new route 34 1. Every other route keeps its items.

## Route positions

The queue matches review verdicts to routes by position (`accepted_routes` in `make_queue.py`).

- **Nothing was deleted or moved.** Routes 1–33 keep their positions.
- **Route 34 is new and appended** (source, ReductiveGroupsPartII RG2.5, item /160). It has no review verdict yet, and its reason says so. `accepted_routes` does not return it.
- **One route was re-pointed in place. Route 26 now joins the Part II `OpenImageTheoremsForAbelianVarieties`** (parent FaltingsFinitenessAndIsogenyTheorems). It was a source route to FaltingsFinitenessAndIsogenyTheorems R28.4, and its accepted verdict was given to that source route.
  - Finding /12 asks for exactly this replacement. The verifier confirmed it and wrote: "Changing route 26 from source to part-ii changes its kind, so its review verdict entry must be re-recorded."
  - An appended route was not possible. Item /196 is route 26's only item, so an emptied route 26 would fail the checker ("names the items it takes"), and deleting it would pass the verdicts of routes 27–33 to their neighbours.
  - Route 26's reason says that its verdict was given to the old source route and that the next review must give a fresh one. Until then, `accepted_routes` returns it with the old "accept" (checked read-only). The maintainer may hold it (see below).
- **Three routes were widened or narrowed in place, each as the verifier directed:**
  - route 7 drops ArithmeticGaloisRepresentations R01.1 from its stages and keeps G7 (/14: "Item 192 is the only item route 7 gives to R01.1, so drop R01.1 from route 7's stages");
  - route 8 adds ModularityAndLanglandsExtensions ML.5 and item /336 (/17(b): "add ML.5 to route 8's stages");
  - route 25 adds AutomorphicSpectralTheory AS.1 and AS.2 and item /335 (/17(a): "AutomorphicSpectralTheory (Eisenstein series, AS.1-AS.2, via route 25 of this file)").

  Each keeps its roadmap. Each reason ends with a dated sentence saying that the stages or items it gained were not reviewed when its verdict was given.
- **Items added to routes whose target is unchanged:** /333 on route 1 and /334 on route 23. Each route's reason says the item has no verdict yet.
- **Routes 2, 3, 4, 13 and 20** lose items or gain text only. Their kinds, roadmaps and stages are unchanged.

## /1 (high, error): the items did not carry the corrected statements: fixed

I followed the verifier's version, which adds item /122 (E136) and the second half of E36 (item /61), drops item /136 from the fix (a note only), keeps /289 unchanged, and uses the brief's stronger form for /170.

- **Item /13** (Lemma 2.1.3): "L an algebraically closed field of characteristic ≠ 2" (E6). The note gives E6's counterexample.
- **Item /170** (Lemma 2.5.1), in the verifier's stronger form: a pure N maximises rank(N^j) for every j and is the unique Weil–Deligne structure doing so; rank N alone characterises it when dim V = 4 and N is symplectic, the case of Corollary 8.2.2 (E16).
- **Item /58** (Lemma 4.2.20): "if l_w ≥ p+2 and k_w ≥ 2p+3" on the T̃_w clause only; the T_w clause keeps l_w ≥ p+1 (E46). The note records E46's deduction of Corollary 4.2.21's T̃_w assertion.
- **Item /263** (Corollary 6.4.3): the i = 1 isomorphism under k_v − l_v ≥ 3N, N = #I + 2#I^c (E83). Item /289's note already carries E83, so it is unchanged, as the verifier found.
- **Item /127** (Lemma 9.2.7) is rewritten in the corrected form of E139 and E140. It has E139's choice of q, and at w|q the local data λ_a ⊕ ε̄^{−1}λ_a^{−1} and λ_b ⊕ ε̄^{−1}λ_b^{−1} with a = p, b = −p. The first bullet of (5) is replaced accordingly. The proof sketch uses the fixed-determinant form of Proposition 9.1.12 with det r̄_q = ε̄^{−1} from the start, and the square-root step is deleted. The note quotes the printed form and records E139's change to the local point at v|q in Theorem 9.2.8 (the canonical lift of E × E′).
- **Item /176** (Lemma 9.2.6) carries E139's strengthened choice of q: q > p², and Frob_q conjugate to complex conjugation in the Galois closure of F(A[p], ζ_p, √Δ_v : v|p).
- **Item /189** no longer says its square-root argument is used in Lemma 9.2.7. It says that E140 deletes that use, as the verifier asked.
- **Item /174** (Proposition 9.1.12) is rewritten in the form of /3 below.
- **Item /130** (Theorem 9.3.4): the "more precisely" clause is restricted to End_K(E) = Z. A sentence covers the CM case, where the first sentence still holds (E144).
- **Items /133, /132 and /178:** "unramified and" is deleted (E147). The chain 10.1.3 → 10.1.1 → Theorem 1.1.7 now matches item /6.
- **Item /139** (Lemma 10.4.6): a_5 = 2^4η^2·3 (E155) and End_C(A) ⊗ Q = D × D (E156).
- **Item /134** (Theorem 10.2.1). This is the verifier's version: E149 is a gap, not a false statement.
  - The ordinary clause is stated under an ordinary point of P(ρ̄)(F_v).
  - The printed hypothesis suffices when F_v = Q_3, through Lemma 9.3.7 of the 2025 paper. I read that lemma in arXiv:2502.20645v1, p. 202: "Let ρ : G_Q3 → GSp4(F3) be an ordinary representation with similitude factor ε^{-1}, and suppose that ρ^∨ is finite flat. Then there exists a genus two curve X/Q3 with a rational Weierstrass point such that ρ_Jac(X),3 ≅ ρ, and Jac(X) has good ordinary reduction and is 3-distinguished."
  - The sketch "the ordinary condition being open" is replaced.
- **Item /136** (Theorem 10.2.6): statement unchanged, as the verifier required. A note cites E149 and E150.
- **Item /122** (Lemma 9.1.10(3)), the verifier's addition: "the image of r̄_λ contains a conjugate of SL_2(F_l)" (E136). The note gives E136's counterexample, and it replaces the note's open question with the pointer to Ribet's theorem.
- **Items /46 and /61** (Propositions 3.8.3 and 4.4.3), the verifier's addition: both now assume p ∤ #Δ(K^p) in the statement (E36). Item /79 (§6.3.8) is unchanged, since #G is invertible there, as the verifier found.
- Every restated item cites its record in the statement or the note. Owners are unchanged.

## /2 (medium, error): definitions and constructions without their corrections: fixed

I followed the verifier's version, with its two additions.

- **Items /41, /209 and /211:** the stabilizer is Z_(p)^{×,+}·O_F^{×,+}(K^p), and Δ := (O_F)_(p)^{×,+}/(Z_(p)^{×,+}·O_F^{×,+}(K^p)) (E29). Lemma 3.5.3 is now true as stated.
- **Item /39:** condition (4) now says "a Z_(p)^{×,+}-multiple of a polarization with kernel of order p² in A[v] at paramodular v", which is Lan's notion only when no K_v is Par(v) (E25). Morphisms satisfy λ = r·f^*λ′ (E26).
- **Item /68** (Proposition 5.5.1): φ ∈ Hom(A, A′) ⊗ Z_(p), not necessarily prime to p, so that it feeds items /70 and /71 (E63). The note gives E63's cancellation argument.
- **Item /59:** the Cousin differential has the sign (−1)^j, the target quotient by s^n_{i_1},…,s^n_{i_{k+1}}, and the class modulo s^n_{i_j} (E52).
  - I checked the sign for d = 2. With (−1)^j, d(f) = −f̄ and then d(f_1, f_2) = f̄_1 − f̄_2, so d∘d = 0. With (−1)^{i_j}, d∘d = −2f̄.
- **Item /243:** the sketch filters by removing one Hasse invariant at a time (E59) and no longer uses the non-exact sequence.
- **Item /57:** "which is not ordinary at w (p-rank at most one)" (E42).
- **Item /232:** Lemma 4.2.15 (E53). The verifier's addition is also applied: item /231's note now says "Lemma 4.2.15 is used in the proof of Lemma 4.2.37".
- **Item /64:** of E57's two readings, as the verifier asked, I chose U_{w′,1} with w′ ∈ I^c and applied it throughout.
  - It is the one the paper uses. In §4.6.8 (TeX, after Lemma 4.6.7), U_{w,1} for w ∈ I^c acts on the strata X^{I,=_J1,=_{J^c}2}_{K,Kli}(p)_1 with J ⊂ I, and the paper cites Lemma 4.6.7 for it.
  - The isogeny underlying U_{w′,1} is an isomorphism on 𝒢_w, so U_{w′,1} preserves Ha(𝒢_w) and Ha′(𝒢_w).
- **Item /109:** "unique positive integers d′_η", with E126's argument in the note, and the contrary paragraph is deleted.
  - I read Proposition 7.4.17(1) on published p. 389: "the special fibres M_{i,F} are distinct, generically reduced and irreducible". The proof of Proposition 7.4.7 combines it with [Tay08, Lem. 2.7].

## /3 (medium, error): E137's correction was too weak for E140: fixed

I followed the verifier's version: parts (a) and (b), and part (c)'s wording.

- **(a) Item /174** states Proposition 9.1.12 with no L/K. Its (2) reads "K/E is linearly disjoint from E′F^(avoid)/E, and L′/K′ is linearly disjoint from K′F^(avoid)/K′", and the diagram has Gal(L′_w/K′_w). E137's correction and reason gain a dated amendment with the same (2).
- **(b)** Item /174 and route 3's brief both state the fixed-determinant variant in full. Its data are a character ψ̄ cut out inside F^(avoid), with ψ̄(G_{E′}) = F_q^×, and local data of determinant ψ̄. Its conclusions are det r̄ = ψ̄, image GL_2(F_q), L′ ∩ K′F^(avoid) = K′(ψ̄) (= K′(ζ_q) for ψ̄ = ε̄^{−1}), and (3)–(5).
  - The proof is the verifier's auxiliary-place argument. Add places split completely in E′F^(avoid) whose Frobenii meet every class (in the variant, every GL_2-class inside SL_2(F_q)). H_0 = Gal(L′/L′ ∩ K′F^(avoid)) then meets every class, and Jordan's lemma gives H_0 = G. In the variant, det(H) = F_q^× makes every GL_2-conjugate of H_0 an SL_2-conjugate, so H_0 = SL_2(F_q).
  - I wrote the hypothesis det(H) = F_q^× as ψ̄(G_{E′}) = F_q^×. Since K/E is linearly disjoint from E′F^(avoid) ⊇ E′(ψ̄), this gives ψ̄(G_{K′}) = F_q^×. In Lemma 9.2.7, E′ = F_1 and q splits completely in F_1, so it holds.
- **(c)** Neither record says that Lemma 9.2.7(6) depends on the disjointness. E140's reason gains a dated note: the SL_2(F_q) hypothesis of Lemma 7.5.22 follows from (3) and (4) alone, since G_{K′(ζ_q)} = ker(det ∘ r̄_q). Item /174's note and item /127's proof sketch say the same. The strong (2) is recorded as what E140's reason uses.

## /4 (medium, error): Lemma 4.6.24 holds only in product form: fixed

I followed the verifier's version, which records the mistake as affecting a stated result.

- **New source issue E160** (gap, affects a stated result, known: new).
  - Its locator is Lemma 4.6.24 (arXiv v3 p. 115; published p. 292) with (4.5.12) (arXiv v3 p. 103; published p. 277).
  - The correction: ∏_{w|p}U_{w,2} ∈ p·End on the Kω^κ complex and on its (−D), G_1 variant, hence U^I ∈ p·End.
  - The reason is the verifier's computation. It says that nothing downstream changes, because Lemma 4.6.25 uses only U^I.
- **Item /246** states Lemma 4.6.24 in that form, for both complexes.
- **Checked.** In the TeX, Lemma 4.6.24 and its proof ("This follows immediately from an examination of (4.5.12)"), and the proof of Lemma 4.6.25 ("By Lemma …, the operator U^I is topologically nilpotent on RΓ(𝔛^{G_1,I}_{K,Kli}(p^∞), Kω^κ(−D))").

## /5 (medium, error): Theorems 8.4.1 and 8.5.2 need finite ramification: fixed

- **Items /118 and /119** gain "(0) ρ is unramified outside a finite set of places", with a note. Route 3's brief adds (0) to Theorem 8.4.1; Theorem 8.5.2 there has "the same statement".
- **New source issue E161** (gap, affects a stated result).
- **Checked.** In the TeX: the five printed hypotheses of Theorem 8.4.1; the proof's condition "At every place w of F′ lying over a place v ∤ p of F for which π_v or ρ|_{G_{F_v}} is ramified …"; and Hypothesis 7.13.1(5), "There is a finite set R of primes of F not dividing p such that if v ∉ R ∪ S_p, then ρ|_{G_{F_v}} is unramified" (published p. 431).

## /6 (medium, error): §6.6 holds only after localizing: fixed

I followed the verifier's version, which adds item /287.

- **New source issue E162** (gap, affects a stated result: Proposition 6.6.2 and Theorems 6.6.4–6.6.5 as stated).
- **Items /287, /289, /290 and /291** are stated after localizing at a non-Eisenstein maximal ideal 𝔪 ⊂ T̃ of the spherical Hecke algebra away from S (item /225). On complexes over C_p, localizing means taking the sum of the generalized eigenspaces that reduce to 𝔪.
- Route 2's brief already asked for the localized forms, and it is unchanged on this point.
- **Checked.** In the TeX: Theorem 3.10.1 "let m be non-Eisenstein", with (1)–(2) for H^i(…)_m; the proof of Proposition 6.6.2, "Indeed, by Theorem 3.10.1 (2), the cohomology groups on each side can be computed in terms of automorphic representations"; and "This is the only place that we use our assumption that i ≤ 1, or the non-Eisenstein localization".

## /7 (medium, error): Proposition 7.10.1 is applied to ideals that are neither open nor nested: fixed

I followed the verifier's version, which records the mistake as an error that affects the proof.

- **New source issue E163.** Its correction gives the verifier's ideals 𝔟_N = (m_Λ^N, x_j^N, (1+y_i)^{p^N} − 1).
- **Item /150** is restated for arbitrary ideals I_N contained in open decreasing ideals 𝔟_N with ∩𝔟_N = 0, the data being reduced modulo 𝔟_N.
  - I named these ideals 𝔟_N and not J_N, because the item already uses J_N for the kernel of Λ → S_∞/I_N.
  - DeformationAndDerivedPatchingAlgebra P8 is added to its planned layers. The P8 stage text reads "Construct patching from systems (R_N,S_N,C_N) where S_N is a finite quotient of O[Δ_N] …".
- **Item /324's note** says that I_N = ker(S_∞ → T[Δ_N]) lies in 𝔟_N.
- **Route 3's brief** cites Proposition 7.10.1 at R03.5, P8 and P9, in the form of item /150.
- **Checked.** In the TeX: Proposition 7.10.1's hypotheses ("a decreasing sequence of open ideals of S_∞ with ∩_N I_N = 0"); "we leave the details of the proof as an exercise"; "write S_N = T[Δ_N]"; and "this data satisfies the assumptions of Proposition 7.10.1".

## /8 (high, duplicate): two design jobs for AbelianSurfacesPotentialModularity: route 3 annotated; the rest is for the maintainer

I followed the verifier's version.

- **Checked myself.** `queue.json` holds, all pending:
  - DESIGN-BCGP18 (order 3, after []) and DESIGN-AbelianSurfacesPotentialModularity (order 143, after []);
  - REV-DESIGN-AbelianSurfacesPotentialModularity;
  - the same pair for BCGP 2025: DESIGN-BCGP25 (order 4) and DESIGN-AbelianSurfacesModularity (order 144).
- **Changed in the deliverables.** Route 3's reason ends with a dated correction:
  - the route is meant for DESIGN-BCGP18 alone;
  - the twin jobs are to be superseded;
  - BCGP18_BRIEF's invitations to plan higher Coleman theory and the Siegel varieties separately belong to routes 2 and 1.
- **Not in a deliverable:** `make_queue.py` and `queue.json`. See "For the maintainer".

## /9 (medium, other): Part II routes are grouped by parent: route 3 annotated; the rest is for the maintainer

- **Chosen option.** Following the verifier, I took the per-id option: one design job per (parent, roadmap id), as PROTOCOL §16 says. So the briefs' imports by roadmap id stay as they are, and no brief was rewritten.
- **Changed in the deliverables.** Route 3's reason names the Part II designs DESIGN-BCGP18 must follow: routes 1, 2, 4 and 5, and OpenImageTheoremsForAbelianVarieties (route 26).
- **Not in a deliverable:** everything else, which is in `make_queue.py` and `queue.json`. See "For the maintainer".

## /10 (medium, duplicate): the GSp_4 Galois representations and spinor polynomial have two owners: recorded here; the re-pointing is for the maintainer

I followed the verifier's version.

- **The Galois-representation half** is RT-AREA-langlands-1/19. Its fix report (`redteam/RT-AREA-langlands-1.fixes.md`, section /19) already gives the exact edits: Calegari–Geraghty 2020 route 28 joining this Part II, and Pilloni 2020 route 15 turned into the same join. Those edits wait for a verdict. I did not redo them.
- **The spinor-polynomial half is new.**
  - Route 4's reason gains a dated correction. It says that GSp4LocalLanglandsAndGaloisRepresentations is the one owner of Q_v(X) and of its identity with rec_GT,p(π ⊗ |ν|^{−3/2})(Frob_v), and that IHG.3 keeps the GL_n polynomial and the conversion interface.
  - Item /163's note records the conflict and names the other extractions' items.
- **Not in a deliverable:** the moves in the three other extractions. See "For the maintainer".

## /11 (medium, duplicate): the Galois representations of ordinary parallel-weight-2 π have two owners: route 3's brief fixed; the rest is for the maintainer

I followed the verifier's version, not the red team's: BCGP 2025's Theorem 1.8.17 is strictly stronger than Corollary 7.9.6.

- **Route 3's brief** (additions, §3) makes AbelianSurfacesPotentialModularity the one owner of the construction in the form of Theorem 1.8.17:
  - GSp_4-valued with ν∘ρ = ε^{−1};
  - WD^ss ≅ rec_GT,p(π_v ⊗ |ν|^{−3/2})^{ss} at v ∤ p;
  - the upper-triangular shape at v|p with potentially unramified α, β;
  - no p > 2, no vast and tidy ρ̄ and no ᾱ_v ≠ β̄_v;
  - proved by interpolation over Boxer–Pilloni's eigenvariety.

  The brief asks the design to plan both parts and to derive Corollary 7.9.6 from them, or keep §7.9 beside them.
- **Its Boundaries now say** that this roadmap imports nothing from GSp4NonregularModularityLifting, and that GSp4NonregularModularityLifting and AbelianSurfacesModularity import this theorem from it.
- **Checked** in arXiv:2502.20645v1, p. 13: "Theorem 1.8.17. Suppose that F^+ is totally real and that p splits completely in F^+. Let π be an ordinary weight 2 automorphic representation for GSp4/F^+. There is a semi-simple representation ρ_π,p : G_F+ → GSp4(Q̄_p) satisfying …", with the three bullets as stated.
- **Not in a deliverable:** the 2025 extraction's items and Calegari–Geraghty 2020 route 1's sentence. See "For the maintainer".

## /12 (medium, error): Serre's open-image theorem sat at R28.4: fixed, route 26 re-pointed in place

I followed the verifier's version, with its three additions.

- **Route 26** is now `part-ii`, parent FaltingsFinitenessAndIsogenyTheorems, roadmap OpenImageTheoremsForAbelianVarieties. Its title and area are copied from PAPER-CALEGARI-GERAGHTY-20 route 5. See "Route positions" for why the change is in place.
- **Its brief states the three statements** route 3 imports, each over a number field:
  - Serre's theorem (item /196);
  - Ribet's large-image theorem for abelian varieties with real multiplication (Amer. J. Math. 98, 1976), for the B[C_2] case of Lemma 9.2.2, with Ribet's exact hypotheses to be stated by the design;
  - the density argument of Lemma 9.2.5.
- **Route 3's four "if that Part II is accepted" clauses** now import from route 26.
- **Checked.**
  - PAPER-CALEGARI-GERAGHTY-20 route 5 has this key. Its brief's statement 3 is "The same over a number field K with End_{K̄}(A) = Z".
  - DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII is pending (order 70).
  - R28.4's and R28.6's stage texts.
- **For the maintainer:** re-record route 26's verdict, and order DESIGN-BCGP18 after this design.

## /13 (medium, error): item 160 sat at ShimuraData D5: fixed

I followed the verifier's version.

- **New route 34** (source, ReductiveGroupsPartII RG2.5) takes item /160. It is appended, and its reason says it has no verdict yet.
- **Its reason asks RG2.5** to state this paper's coordinates with the conversions to the Pilloni (2020) basis e_1, e_2, e_3 and to Calegari–Geraghty's (a,b;c). D5 keeps only the Siegel-datum data, following Pilloni's routes 20 and 25, and imports the root datum through the edge RG2.5 → D5.
- **Route 20** keeps item /319, and its reason says why.
- **Checked.** PAPER-PILLONI-20 route 25 (gsp4-self-dual-root-datum at RG2.5) and the RG2.5 stage text. The edge is acyclic (see Checks).

## /14 (medium, error): Patrikis's lifting at R01.1 made a cycle: fixed

I followed the verifier's version.

- **Item /192** belongs to ArithmeticGaloisRepresentations G7, and its note says why.
- **Route 7** drops R01.1 from its stages; see "Route positions". Its reason names the edges R06.2 → G7 and R02.4 → G7.
- **New item /334**, Tate's theorem H^2(G_F, Q/Z) = 0 (missing), goes on route 23 (ArithmeticGaloisDuality R02.2, R02.4), whose reason now asks R02.4 for it.
- **Route 3's import line** reads "Patrikis's lifting (ArithmeticGaloisRepresentations G7), with Tate's theorem … R02.4".
- **Checked.** The read-only reachability test below confirms both halves of the finding: R01.1 reaches R06.2 and R02.4, and neither R06.2 nor R02.4 is reachable from G7.
- **For the maintainer:** a requests entry in the ArithmeticGaloisDuality packet.

## /15 (medium, duplicate): the §6.5 items were routed twice: fixed

I followed the verifier's version.

- **/264 is merged into /144.**
  - /144 takes /264's itemised statement.
  - Its note combines both notes and drops the stale "the measure used" sentence.
  - The T0 claim is reconciled: T0 plans "the integral differential calculations", into which the degree goes as a source, and no layer plans the degree.
- **/265 is merged into /259.**
  - /259 takes /265's itemised statement with 𝓧^{mult} and 𝓧((ε_v)), keeping "δ as in §6.5.1 (item 144)".
  - Its note keeps /265's note on the lower-bound notation of §6.5.3 and drops "see the next two items".
- **/264 and /265 are removed**, from routes 13 and 2 and from the item list. Route 13's reason no longer has its parenthesis, and route 2's count reads 85.
  - Items /83, /271 and /285 cite §§6.5.1–6.5.2 by section number, as the verifier found, so they needed no change.
  - No other file names /264 or /265 except the red team's own files.
- **Items /38 and /159 are not merged.** The verifier found that they are not a duplicate: they have one owner, RG2.3, and state different material (§2.1.1 matrix shapes against the §3.3.1 lattice chain with its pairings).

## /16 (medium, missing): the minimal compactification had no item: fixed

I followed the verifier's version: a construction item, and no separate affineness theorem.

- **New item /333** (construction, missing, route 1): X^*_K at hyperspecial level (from C5), X^{*,G_1}_K = Δ\X^*_K, the boundary ∂_0X^* ⊔ ∂_1X^*, π_*O = O, π_*I_D = I_{∂X^*}, R^1π_*I_D = 0, and the descent of det ω.
  - Route 1's brief already plans it ("X^{G_1,*}_K = Δ\X^*_K. Plan here the boundary strata of both").
  - Items /221, /224, /235 and /78 cite it in their notes.
- **Items /59 and /242** cite items /182 and /221 for the affineness of the image of the stratum, with the verifier's one-line argument and the Δ-descent step.
- **Item /54** records the unstated descent of powers of Ha(𝓖_w) and Ha′(𝓖_w) to the minimal compactification. Route 2's brief plans it with the §6.6 two-affinoid cover (item /286).
- **Checked.** The proof of Lemma 3.10.7 in the TeX: "π_*O_{X_K^{G_1}} = O_{X_K^{*,G_1}}, π_*I_D = I_{∂X^*}, and R^1π_*I_D = 0", and "∂_1X^* is a union of Hilbert modular varieties for the group Res_{F/Q}GL_2, and the complement ∂_0X^* is a finite union of points".

## /17 (medium, other): statuses and owners: fixed as the verifier narrowed it

- **(a)** Isobaric sums are split from item /162 as the new missing item /335, routed once through route 25 (AutomorphicSpectralTheory AS.1–AS.2), as the verifier directed. Item /162 keeps solvable base change (planned at ET.7a and ML.5).
- **(b)** Kim's exterior square (part (b) of item /195) is the new missing item /336, routed as a source of ML.5 through route 8.
- **(c)** Item /11 is unchanged: the verifier found that ST.5 is in an unpromoted draft packet. Item /35's note is reworded as the verifier wrote.
- **(d)** Item /204 gains the optional cross-reference note to the two draft nodes, which plan nothing yet.
- **(e)** No change: the verifier rejected this part.
- **(f)** ET.7a is added to item /185's planned layers.
- **For the maintainer:** the Allen et al. 2023 extraction's item 18 must be changed to match (a).

## /18 (low, missing): not applied

This is a low finding, recorded only.
- Carayol's lemma for GSp_4 (Gee–Geraghty 2012, Lemma 7.1.1) is to be added as a theorem item with both uses. As the verifier corrected, it goes to IHG.1 (descent to the Hecke algebra) and ArithmeticGaloisRepresentations G7 (uniqueness of lifts), where Calegari–Geraghty 2020 route it, with R04.2/carayol-trace-theorem as its GL_n prerequisite.
- Item /106 should cite it.

## /19 (low, other): not applied

This is a low finding, recorded only. It lists slips that items correct silently, with no source issue.
- Theorem 3.5.1(3) is to be recorded as an error that affects a stated result.
- Remark 3.9.21, Remark 7.5.23 and the δ_H bundle of §6.5.1 are further slips, among others.
- The verifier added the U_{v,2}∘θ slip of Corollary 6.4.3, which item /262 corrects silently.
- E160–E163 are now taken, so these records should start at E164.
- The δ_H bundle is now in item /144 only, since /264 is merged into it.

## /20 (low, other): not applied

This is a low finding, recorded only. It asks for amendments to E2, E36, E112 and E113, including dropping both ψ = ε^{−1} and "p unramified in F" from Lemma 7.6.1, as the verifier corrected.

## /21 (low, error): not applied

This is a low finding, recorded only.
- Item /30: M̄ and σ: M̄ → M̄_λ, referring to item /156.
- Item /73: p ≥ 3.
- Item /53: a pointer to item /241.
- Items /2–/7 and /29: pointers to item /33.
- Item /101: add (0) ν∘ρ̄ = ε̄^{−1}.

## /22 (low, other): not applied

This is a low finding, recorded only. The verifier confirmed (i), (ii), (iv) and (vi), and rejected (iii) and (v).
- (i) Tidiness: one owner, ArithmeticGaloisRepresentations:G7, named by its full id.
- (ii) Pure Weil–Deligne representations: one owner.
- (iv) An explicit GSp_4-branch sentence in routes 6 and 9.
- (vi) Optionally, complete the prerequisites fields.

## /23 (low, other): not applied

This is a low finding, recorded only. The result file still has no `sourceVersions` key. The verifier's hashes, which I also found on the local copies used here, are:
- published PDF b4cc8b01…8454af;
- arXiv v3 PDF 7c8d74b0…5689ed;
- e-print 7f31218b…1dabb.

All three were read 2026-09-23. The new records E160–E163 name them in `searched`.

## /24 (low, other): not applied

This is a low finding, recorded only. It asks for published pages in the locators of items /113–/119, /179 and /182, for item /78 to start at p. 326, and preferably for the other locators without a page. The new records E160–E163 give published pages, which I checked in the published PDF.

## For the maintainer

These changes lie outside this job's deliverables.

- **Duplicate design jobs (/8).** As the verifier corrected the fix:
  - In `make_queue.py`, deduplicate paper designs by roadmap id. When a hard-coded design has the roadmap id of an accepted `new` or `part-ii` route, append the route's opening and a pointer to its full brief to that job, instead of creating DESIGN-<roadmap id>. For this paper, the pointer is route 3 of `papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json`.
  - In `queue.json`, set DESIGN- and REV-DESIGN-AbelianSurfacesPotentialModularity, and DESIGN- and REV-DESIGN-AbelianSurfacesModularity, to `superseded`, and close their tracking issues. make_queue keeps old jobs it no longer produces, so deduplicating alone does not remove them.
  - DESIGN-BCGP25 must receive the brief of BCGP 2025 route 12 in the same way.
  - Change BCGP18_BRIEF. It should point to route 3 as the binding ownership split, and drop both the invitation to propose higher Coleman theory as its own roadmap (that is route 2, HigherHidaAndColemanTheory) and the Siegel-variety coverage (route 1).
  - If DESIGN-BCGP18 may be claimed before the next regeneration, add the pointer as a `promptPreface`, which survives regeneration.
- **Part II grouping and order (/9).** Take the per-id option.
  - Group `part-ii` routes in `paper_designs` by (parent, roadmap id), so that HilbertSiegelModularVarieties, HigherHidaAndColemanTheory, IntegralCoherentHeckeComplexes, GSp4LocalLanglandsAndGaloisRepresentations and OpenImageTheoremsForAbelianVarieties each get a design job DESIGN-<roadmap id>.
  - Mark the old DESIGN-<parent>PartII jobs and their reviews superseded.
  - Give DESIGN-BCGP18 `after` edges to the designs, preferably the design reviews, of the Part IIs it imports: routes 1, 2, 4, 5 and 26. Give DESIGN-BCGP25 the same edges.
  - Order the HigherHidaAndColemanTheory design after the HilbertSiegelModularVarieties design, which route 2 lists as a prerequisite.
- **Spinor Hecke polynomial (/10).** GSp4LocalLanglandsAndGaloisRepresentations is the one owner; IHG.3 keeps the GL_n polynomial and the conversion.
  - Move Calegari–Geraghty 2020's hecke-polynomial-Q-x into its new route 28 (the join from FIX-RT-AREA-langlands-1).
  - Move Pilloni 2020's hecke-polynomial-gsp4 into its joined route 15.
  - Move BCGP 2025's 1.8.27-hecke, 1.8.28-Q and 1.8.28-P into its route 35.
  - Leave the Cayley–Hamilton and gluing items and Pilloni's maximal ideal m at IHG, importing the polynomial.
  - Append routes rather than renumbering, and record the verdicts. Until this is done, the conflict should be noted in the reviews of those three papers.
- **Ordinary weight-2 Galois representations (/11).**
  - In PAPER-BOXER-CALEGARI-GEE-PILLONI-25, give 1.8.17-existence and 1.8.17-local to AbelianSurfacesPotentialModularity. They can be marked `planned` there once that roadmap's design lands; until then, re-route them to join it.
  - In PAPER-CALEGARI-GERAGHTY-20 route 1, remove "AbelianSurfacesPotentialModularity … should import this roadmap". This keeps the import direction acyclic.
- **Route 26 (/12).**
  - Re-record its entry in `papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.review.json`, whose accept was given to the old source route.
  - Regenerate DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII with it.
  - Hold route 26 if a reviewed verdict is required first.
- **Unreviewed routes and items.** The next review of this extraction should give verdicts on:
  - route 34 (new) and route 26 (re-pointed);
  - the stages and items that routes 7, 8 and 25 gained or lost;
  - items /333–/336 and the merged items /144 and /259;
  - E160–E163 and the amendments to E137 and E140.
- **Tate's theorem (/14).** Add to the ArithmeticGaloisDuality packet a `requests` entry at R02.4 for H^2(G_F, Q/Z) = 0 and the lifting of continuous projective representations (item /334). Add the stage edges R06.2 → ArithmeticGaloisRepresentations:G7 and R02.4 → G7 when that roadmap is blueprinted.
- **Isobaric sums (/17a).** In PAPER-ALLEN-ETAL-23, item 18 marks global isobaric sums planned at ML.5 and AG2.2. Change it to cite AutomorphicSpectralTheory AS.1–AS.2, the owner chosen here (item /335).
- **Errata register.** E160–E163 are new, and E137 is amended. Let `scripts/errata.py` regenerate `research/errata/REGISTER.md`; this job did not run it.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 3 files, 0 problems.
- **`make_queue.accepted_routes('PAPER-BOXER-CALEGARI-GEE-PILLONI-21')`**, run read-only, returns routes 1–33 in their order. Route 26 is the OpenImageTheoremsForAbelianVarieties join, and route 34 is not returned.
- **Edits.** One Python script edited the result and one edited the paper report.
  - Each substitution asserted that its old text occurred exactly once in its field, and each replaced route asserted its old stages or items.
  - The result script also asserted the final invariants: 334 items in increasing order with only 264 and 265 absent; 298 missing items, each taken by exactly one route; 33 planned and 3 library; 34 routes; source issues E1–E163; and no remaining reference to /264 or /265.
  - The result keeps its formatting: indent 1, non-ASCII characters written literally, no final newline. I checked before editing that re-serialising the file gives it back unchanged.
- **Cycle test.** Read-only, on the atlas that `scripts/build.py` assembles in memory (2,840 stages, 8,258 stage edges).
  - New edges: RG2.5 → D5; R06.2 → ArithmeticGaloisRepresentations:G7; R02.4 → G7; and AS.1, AS.2 → ML.4 for the isobaric sums.
  - The model also has placeholder nodes for the proposed roadmaps with their imports: OpenImageTheoremsForAbelianVarieties (R28.4, G7), AbelianSurfacesPotentialModularity (OpenImage, G7, R02.4, ML.4, ML.5, AS.1, AS.2, RG2.5, D5, P8, P9, R03.5, R23.1 and routes 1, 2, 4, 5), and GSp4NonregularModularityLifting and AbelianSurfacesModularity importing AbelianSurfacesPotentialModularity.
  - No new edge has a reverse path, and the whole graph (2,506 nodes, 8,296 edges) is acyclic.
  - The old ownership would have closed a cycle, as /14 says: R01.1 reaches both R06.2 and R02.4.
- **Sources read for this fix (30 September 2026).**
  - The arXiv v3 LaTeX source (e-print sha256 7f31218b…).
  - The text of the arXiv v3 PDF (7c8d74b0…) and of the published PDF (b4cc8b01…), for pages. The arXiv API still lists v3 as the latest version, and the Centre Mersenne article page records no erratum.
  - BCGP 2025, arXiv:2502.20645v1 (Theorem 1.8.17, p. 13; Lemma 9.3.7, p. 202; Remark 9.4.4, p. 206).
- **Citations.**
  - Every stage and node cited was read in `research/blueprint/atlas/roadmaps/`, `research/blueprint/packets/` or `data/atlas.json`: RG2.5, D5, R02.4, R06.2, G7, P8, ET.7a, ML.5, AS.1, AS.2, R28.4, and the draft nodes R24.5/system-l-functions and ML.2/compatible-system-l-function-continuation.
  - No Mathlib or Tau Ceti declaration is newly cited.
- No Lean was run. The scratch files were deleted after the checks.
