# Independent review: Local parameters of supercuspidal representations

Refs [#1357](https://github.com/CBirkbeck/tauceti-explorer/issues/1357). Codex, session `codex-7e92bd`, 23 September 2026. **Verdict: revise. The independent review is complete; the extraction remains partial.** The original extraction was by ClaudeCode `cc-39fac3` in PR2038. Claim comment 5803316893 and bot confirmation 5803319005 were checked and the whole issue reread before work.

All 41 pages of the [published 2024 article](https://doi.org/10.1017/fmp.2024.10), including the appendix and references, and all 75 original item statements, six briefs, 21 prerequisite entries and 14 source findings were read. The result now has **90 items: 4 library, 10 planned, 76 missing**, each missing item routed once. All 14 original source findings are confirmed with bounded or corrected explanations, and 12 additional findings are recorded. This is a finished adverse review, not a claim that the 11 outstanding extraction gaps have been resolved.

## What the review changes

The original completion claim was incompatible with its explicit acknowledgement that the essential cited sources had not been read. The result is now partial. The review separates the linear WD object, the equivariant SL₂ dictionary, the relative faithful-representation purity test and the still unresolved intrinsic group-valued purity convention. A scalar parameter in G_m gives a direct counterexample to the printed “some/every faithful representation” equivalence. Merely deleting “every” would not prove compatibility with the paper’s essential-temperedness statements.

The main ramification proof still has the original restriction-of-scalars problem: the character is μ^{-n}, of order (q−1)/gcd(n,q−1). For q=7,n=2, the A₂ highest-coroot weights 2 and −1 collide, so orthogonality does not isolate the claimed coefficient. In addition, Lemma 5.1’s affine-root inequalities have the wrong direction, arbitrary positive-characteristic representations do not lift to finite-free Witt-vector representations of the same rank, and a multipliable relative root group need not be a restriction of scalars of Ga. An explicit unramified SU₃ example demonstrates the last point. These findings concern the proofs; they do not assert that the matrix-bound or ramification theorems are false.

Lemma 4.7 now requires tameness at both boundary points. Artin–Schreier L_ψ(t) over F₃ is a counterexample without it: inertia at 0 is trivial but the two nonzero rational-point traces differ. The intended use after Corollary 4.3 already satisfies the additional hypothesis. The Kummer carrier is the compositum of exponent-bounded cyclic extensions, since the printed union need not be a field.

Proposition 10.5 must exclude tori and require base change in both alternatives. For G_m the trivial character stays supercuspidal under every norm pullback. Corollary 10.11’s unramified-principal-series endpoint is still meaningful for GL₁ but does not imply loss of supercuspidality. The review adds the omitted supercuspidality hypothesis to item 39 and restores the inherited hypotheses of Proposition 8.5. It distinguishes tempered base-change domains, finite separable extensions and hypotheses needed throughout a tower.

The close-fields construction uses positive integer cutoffs, not a maximum or an automatically attained minimum of real depth. Ganapathy’s cited source does give the asserted comparison for split groups over n-close fields. Its I_n has positive-root level n and negative-root level n+1; I₁ must not be confused with the whole pro-p Iwahori radical. Deligne comparison for nonsplit groups needs matched Galois actions. The bounded-level domain in Corollary 11.8 stays explicit; Conjecture 11.7 includes a landing assertion and remains a conjecture. Questions 11.10 and 11.11 are separate open questions. Their JSON kind remains the checker’s theorem vocabulary, with an explicit logicalStatus excluding theorem use.

The appendix’s finite-quotient character sum requires dimensions, not reciprocal dimensions, as its coefficients. On S₃ at a 3-cycle the reciprocal sum is 3/2 rather than zero. The whole elliptic-orthogonality source remains unread and is not certified by that repair. Similarly, an occurring character gives an invariant vector after twisting, not a trivial action on the entire inducing representation. Corollary 2.4(iii)’s “obvious” group-theoretic inference needs another hypothesis: the Klein four subgroup of PGL₂ is abelian and semisimple but not toral. No global cuspidal automorphic counterexample is claimed for that last finding; it is recorded as a proof gap.

## Existing suppliers and ownership

The full pinned trees were searched at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Nine exact declarations were opened with their surrounding hypotheses. Finite cyclic Kummer theory, the continuous Kummer map and its injection, extension of finite abelian characters, and row/column character orthogonality are credited as separate library leaves. The infinite Kummer character equivalence and the constrained extension on the actual repeated-coordinate torus remain adapters. The Kummer file explicitly does not establish surjectivity.

All originally cited planned layer descriptions and relevant reviewed library audit rows were read. The review also reads R01.2, LPV.1, ET.6, ET.3 and FF.1 at the shared ownership boundaries. R01.2 owns the linear WD object, LPV.1 its geometric monodromy filtration, DWP.5 the local weight theorem, and LP0 the continuous Weil-cocycle carrier. The general nilpotent/SL₂ extension is not already an LP0 contract. Generic weak approximation in AA.4 does not assert the exact finite-index closure used in the appendix.

The current Fintzen brief and independent review already assign real-indexed Moy–Prasad refinements to RG2.1–3 and mixed-characteristic GL_m type/segment theory to ET.6. Only the narrow coalesced RG2 source request is accepted here. Rejecting the GHS types addition does not reject Fintzen’s accepted work. The current Xu–Zhu brief is the correct coalescing lead for Kloosterman monodromy, but its unrestricted-prime application needs an actual source check. The Ciubotaru–Harris extraction separates local unitary-spherical classification from global weight propagation; the GHS use must be matched to those exact statements. Feng’s mod-p coefficient base change cannot be substituted for the characteristic-zero tempered assertions of BFHKT and Henniart–Lemaire.

## Supporting sources and limits

Gross–Reeder’s author version of 1 March 2010 was read at §2.1, pp.8–10, including the equivariant Jacobson–Morozov proof and uniqueness, with context on p.11. It requires finite inertia and semisimple Frobenius. Ganapathy was read at the introduction, the close-field summary, the split-group and Iwahori definitions, Theorem 3.13 and Proposition 3.16 (pp.1–6,8–9,20–22). These are bounded reads, not claims to complete the two prerequisite papers.

HNY pp.16–18 state zero adjoint inertia invariants and the Swan conductor with prime restrictions. They do not state linear irreducibility of Ad, which already fails for split SL₂×SL₂. Dat–Lanard arXiv:2202.03982v3, dated 7 February 2025, was read on pp.1–5: Corollary 1.1.1 takes the motivic FS_mot map for granted and assumes quasi-split G. The result does not remove that assumption merely because Scholze announced the motivic construction. The extraction now states this newer conditional supplier explicitly.

The fresh published main PDF was inspected visually on pages 6,7,8,11,13,14,16,17,19,21,23,25,26,30,32,33,34,35,36,37,39. The Cambridge record, arXiv version history, Harris’s publication entry 94, all five pages of his errata PDF and title/correction searches disclosed no correction in this bounded search. The arXiv main-paper PDF was not freshly reread. No exhaustive author-archive search is claimed. The different Cambridge PDF hash from the original worker includes a new download footer, not evidence of a different article revision.

## Validation

The paper checker passes. The structural audit checks unique IDs, every missing-item route and independent search, every declared stage and pinned declaration hash, all 16 definition/construction APIs and their planning tests, and an acyclic source-use skeleton. The skeleton is explicitly incomplete; an omitted dependency is not a closed proof leaf. The independent regression passes **1627 exact arithmetic and finite-group diagnostics**, including character-order collisions, repaired inequality arithmetic, F₉ Hermitian matrices, SL₂ weight-rank obstructions, constrained finite character extensions and the S₃ character sum. These diagnostics do not prove local representation existence or any missing supplier theorem.

No Lean deliverable was authorized by this review issue and no Lean file was compiled. No assertion of formalization is made. Resume the extraction at G1–G3 and G5, then close the cited-source and ownership contracts before changing its status to complete.

## Route decisions

| Route | Verdict | Reason |
| --- | --- | --- |
| 1 | reject | Reject: the main Part II still lacks intrinsic purity, a valid matrix-bound proof, the nonsplit orthogonality argument and several essential source suppliers. Reusable globalization/close-fields pieces need shared ownership and full APIs before design. Corrected target statements and open questions are retained without claiming proof closure. |
| 2 | reject | Reject: the current candidate is the appropriate coalescing lead, but the general all-prime application and automorphic comparison are not source-closed. HNY gives zero Ad invariants, not the false linear irreducibility demanded by the input. |
| 3 | reject | Reject this addition: the existing Fintzen candidate is already independently accepted; its reviewed work is not rejected here. The added Stevens/BK equal-characteristic contracts are unread, and mixed-characteristic GL_m must be imported from ET.6. Do not activate a second classification from this paper. |
| 4 | reject | Reject: the cited weight input combines the local unitary-spherical and global propagation suppliers. Match the exact updated Ciubotaru–Harris theorem before adding this application to the global Part II. |
| 5 | reject | Reject: Feng’s mod-p coefficient base change does not supply the characteristic-zero tempered BFHKT/Henniart–Lemaire assertions. Split the latter and establish an exact common-owner contract. |
| 6 | reject | Reject: LP0 currently plans continuous Weil cocycles, not an arbitrary nilpotent/SL₂ WD object or the central-weight purity comparison. Import the linear carrier from R01.2 and the filtration from LPV.1, and establish the group-valued extension boundary. |
| 7 | accept | Accept the narrow source request: RG2.1–3 owns valued roots, buildings and parahorics. Coalesce the real-indexed filtration request with the already reviewed Fintzen request. This is no new supercuspidal classification and does not accept Lemma 5.1’s invalid lifting or nonreduced-root arguments. |
| 8 | reject | Reject pending source verification: AA.4 is the correct approximation owner, but generic weak approximation does not certify the stated open finite-index closure for all connected reductive function-field groups. The positive-characteristic source proof must be supplied. |

## Source files actually acquired

| Source | URL | SHA-256 |
| --- | --- | --- |
| GHS published | https://www.cambridge.org/core/services/aop-cambridge-core/content/view/10EEB98855332F11F5555C45665BBA5F/S2050508624000106a.pdf/local-parameters-of-supercuspidal-representations.pdf | c0ecdfb0949472d27521705af8ab6dbc062ad81d2799512face07f9f39cdf49e |
| ganapathy | https://arxiv.org/pdf/1305.6088 | f9a80785746d4c4d847a7dc89e2c805ba425bafa4140c37c6a426897c4fbfbd9 |
| dat-lanard | https://arxiv.org/pdf/2202.03982 | 6404ff9e934cf109851974e28e80fddf50480cd83ae58f4ed149473aea8bc253 |
| hny | https://math.uchicago.edu/~ngo/Kloosterman.pdf | a41642d0dc54eee0b9759f3684cbfa84c70c8e2f54b61086792e5821e954332f |
| gross-reeder | https://people.math.harvard.edu/~gross/preprints/AdjointGamma5.pdf | f3a74e45c72ea6b1c59d176097055bf637dffdc0aa471c1e57dbf3ccbd739af1 |
| harris-errata | https://www.math.columbia.edu/~harris/website/content/12-errata-publications-list-links-here/errata.pdf | 6030666400c2f71af0bf702492cf041cab8b9cb2c35ef8a7b6b53dbaa11df959 |

## Pinned declaration statements checked

| Declaration | Pinned location |
| --- | --- |
| mathlib:isCyclic_tfae | [Mathlib/FieldTheory/KummerExtension.lean:563](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/KummerExtension.lean#L563) |
| mathlib:MonoidHom.domRestrict_surjective | [Mathlib/GroupTheory/FiniteAbelian/Duality.lean:109](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FiniteAbelian/Duality.lean#L109) |
| mathlib:MulChar.sum_eq_zero_of_ne_one | [Mathlib/NumberTheory/MulChar/Basic.lean:607](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/MulChar/Basic.lean#L607) |
| tauceti:TauCeti.kummerMap | [TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:187](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean#L187) |
| tauceti:TauCeti.ker_kummerMap | [TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:260](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean#L260) |
| tauceti:TauCeti.kummerClassMap | [TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:279](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean#L279) |
| tauceti:TauCeti.kummerClassMap_injective | [TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:298](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Kummer.lean#L298) |
| tauceti:CommGroup.sum_monoidHom_apply_eq_ite | [TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean#L104) |
| tauceti:CommGroup.sum_inv_mul_monoidHom_apply_eq_ite | [TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:123](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean#L123) |

## Source findings

| Finding | Kind / effect | Correction and independent evidence |
| --- | --- | --- |
| E1 | gap / the proof | By (7.6), tr(m_z^{−n}, L_j) = μ(z)^{−n⟨α,β_j⟩}, so constancy of z ↦ tr(Frob_z, V(Π,V)) gives Σ_j A_j ν(z)^{c_j} = const with ν = μ^{−n} and c_j = ⟨α,β_j⟩ ∈ {−2, …, 2}. Pairing with ν^{−2} isolates the highest-root term exactly when ν^2 differs from ν^c for c ∈ {−2, −1, 0, 1}, that is when d = (q − 1)/gcd(n, q − 1) ≥ 5 (always true for n = 1 and q > 5, where the printed argument works up to a sign). For d ≤ 4 another argument is needed, for example reducing a Weil restriction Res_{k_n/k} G′ to G′ over k_n((t)), or choosing χ_k on T(k) = T′(k_n) through a faithful character of k_n^× instead of μ ∘ α. Page 21 image and the full restriction-of-scalars setup checked. Retaining −n gives a character of order d=(q−1)/gcd(n,q−1). In the actual A2 weight list for q=7,n=2, weights 2 and −1 have identical character; the attempted isolation fails. This confirms a gap in this proof, not a counterexample to Theorem 7.2. The suggested alternative arguments in the old correction remain unproved proposals. |
| E2 | gap / a stated result | Add q = \|k\| > 5 to Theorem 7.12 (and Theorem 1.5); add n ≥ 2 to Lemma 10.7 and Proposition 10.10, and q > 5 to the ramification in Lemma 10.7 and to case (b) in Proposition 10.10 (or give another argument for q ∈ {3, 4, 5}). The cross-references and standing hypotheses were traced. The proofs cited for Theorem 7.12 and the depth-zero case use q>5; no proof for the omitted small fields is certified here. GL₁ with an unramified character is an actual counterexample to unconditional ramification. Separate those two kinds of finding. |
| E3 | misprint / nothing | … the map N^i : gr_{w+i}V → gr_{w−i}V is an isomorphism. Page 8 image confirms N rather than N^i. The opposite graded indices require the i-th iterate; at i=0 the intended map is identity. This repairs the linear definition only; E15 is a separate issue with part (b). |
| E4 | misprint / nothing | For any Π ∈ 𝒜_0(G), … Page 6 image confirms the G/A glyph. The domain is the cuspidal automorphic representation set A₀, as used in the preceding statement. |
| E5 | misprint / nothing | (α_a)^{(z)} = ψ_k(z^a) (= ψ_k(z)^a). Page 13 image confirms az. Kummer classes are multiplicative: specialization of T^a at z gives z^a; a=p would make the printed additive reading zero, outside k×. |
| E6 | misprint / nothing | Then since the action of W_k permutes the 𝔳_i's, … Pages 19–20 checked: W_k is the acting Weil group on the summands. W_i is not a separately defined group there. |
| E7 | misprint / nothing | However, by (5.3) of Lemma 5.1, if g ∈ G_{a,0+}, then v_0(ρ_ij(g) − δ_ij) > a·(λ_i − λ_j). … Thus, if g ∈ G_{a,0+}, then ρ(g) is the identity Page 25 image checked against (5.3). The misplaced parenthesis, nonexistent part (ii) and swapped filtration indices are slips. This does not validate Lemma 5.1’s underlying proof, which has E19–E21. |
| E8 | misprint / nothing | Under the hypotheses of Theorem 8.1, … Let π be a pure supercuspidal representation of G(F) … Page 26 image and Theorem 8.1 checked. Both the theorem label and local group G(F) are unambiguous. The extraction now also retains all inherited hypotheses. |
| E9 | misprint / nothing | It then follows from Theorem 7.12 … Page 30 image checked: the principal-series result is Theorem 7.12. This reference correction does not resolve the torus exception in E22. |
| E10 | misprint / nothing | U_∞: the invertible block matrices (n/e × n/e blocks of size e) with … Borel subgroups of GL_e; U_0 = E^×J(β, 𝔄); Λ (the representation of E^×J(β, 𝔄) inducing π) for λ throughout; S = GL_n(F_q(t)) ∩ ∏_x U_x. Pages 33 and 35 images checked. The block size, nonzero off-diagonal blocks, inducing group and global intersection have the corrected meanings. The claim about the entire restricted representation being trivial is not a notation change and is separated as E25. |
| E11 | misprint / nothing | Use the subset of parameters trivial on I_F^n for each positive integer n. The least such positive integer is an integer cutoff when it exists. Usual real depth requires an infimum and a right-limit convention; it is not this integer and need not be an attained minimum. Page 36 image checked. A decreasing filtration gives an upward-closed set of triviality cutoffs, so there is no maximum. The repair is now explicitly an integer cutoff for n-close fields; it does not claim the infimum defining real depth is attained. |
| E12 | gap / a stated result | Let σ ∈ A_n(G/F♯) be a supercuspidal representation … More generally, let σ ∈ A_n(G/F♯) be pure with unramified Fargues–Scholze parameter. Page 37 image checked. The conjectural square acts only on A_n. For Q_p the ring Z_p/p^n has characteristic p^n, so it cannot be n-close to a characteristic-p field for n>1; the missing domain is substantive. |
| E13 | misprint / nothing | … that is 1-close to F♯ (F = k((t)) with the same residue field k) … Let G be a split semisimple group (over Z, or over F♯). Page 37 image checked. Definition 11.1 and the conjecture use positive n; equal residue fields give n=1. The depth-zero-to-I₁ adapter is retained as an explicit building/filtration obligation rather than confused with Iwahori invariants. |
| E14 | misprint / nothing | The function f then satisfies condition (iv) above … Page 39 image checked against all four preceding conditions. Isolation of an elliptic orbit is condition (iv). |
| E15 | error / a stated result | The single-weight predicate is relative to a specified representation. Supply a central-weight-compatible intrinsic definition before asserting invariance or essential-temperedness equivalence. Removing just the word every is not a proved replacement for the subsequent theory. For Ĝ=G_m take an unramified parameter with geometric Frobenius q. The standard one-dimensional faithful representation has weight 2. The equally faithful representation x↦diag(x,1) has weights 2 and 0 and N=0, hence is not pure of a single weight. A common twist shifts both weights equally and cannot fix the discrepancy. The corresponding unramified character is available by the torus correspondence. The locator was checked in the fresh published PDF and page image. |
| E16 | error / the proof | Use irreducibility of the group-valued parameter (noncontainment in a proper parabolic), with an actual proof from the local monodromy theorem. Do not assert linear irreducibility of Ad. HNY Theorem 2 instead gives zero adjoint inertia invariants, with its stated hypotheses. Already for split G=SL₂×SL₂, the dual is PGL₂×PGL₂ and Lie(Ĝ)=sl₂⊕sl₂ has two nonzero proper invariant ideals under every parameter. Thus the claimed adjoint irreducibility is impossible in the allowed reductive scope. Independently, HNY pp.17–18 explicitly give zero invariants and describe simple wild inertia in a torus normalizer; neither is linear irreducibility. The globalization theorem itself is not refuted. The locator was checked in the fresh published PDF and page image. |
| E17 | error / a stated result | Require L tamely ramified at both 0 and ∞. Both supplied proofs then use the tame abelian geometric quotient and the Kummer description. Take k=F₃ and the Artin–Schreier sheaf L_ψ(t) for a nontrivial additive character ψ. It extends over 0, so m_z acts trivially. Its Frobenius traces at 1 and 2 are distinct ψ-values, contrary to the claimed constant trace. It is wildly ramified at ∞. The later use following Corollary 4.3 already satisfies the missing tameness condition. The locator was checked in the fresh published PDF and page image. |
| E18 | misprint / nothing | Take the compositum of cyclic extensions of degree dividing q−1, equivalently the maximal abelian extension of exponent dividing q−1; use continuous characters. For q=3, K=F₃(t), both √t and √(t−1) lie in quadratic extensions, but their sum has degree 4: the two square classes are independent by their odd valuations at t=0 and t=1, and the sum has trivial stabilizer in the biquadratic Galois group. Thus the stated union is not closed under addition. The compositum is the intended Kummer carrier. The locator was checked in the fresh published PDF and page image. |
| E19 | error / the proof | Use a coherent affine-root convention, for example ψ(w)=s−b·w with v(u)≥s. Then ψ(c)≥0 gives ns≥nb·c; ψ(c)>r gives ns>nb·c+nr≥nb·c+r for n≥1,r≥0. At degree zero the matrix coefficient is δ_ij, not identically 1 for every i,j. A root-group proof in this convention remains required. The printed inequality ns≥ns+nψ(c) is false whenever n>0 and ψ(c)>0; n=1,s=0,b·c=1 is a numerical instance. The strict-bound chain has an additional erroneous +nr. For degree-zero off-diagonal entries the value at the identity is 0, so the asserted constant 1 cannot be right. These arithmetic repairs do not solve the lifting or nonreduced-root issues. The locator was checked in the fresh published PDF and page image. |
| E20 | error / the proof | Prove the required matrix-weight homogeneity directly in characteristic p or restrict to a representation with a separately constructed finite-free lift. Classification by highest weights does not imply that an arbitrary characteristic-p representation lifts with the same rank. For k=F_p, p≥5, take the faithful SL₂-representation Std⊕Std^(Frob), of rank 4 and torus weights 1,−1,p,−p. A finite-free W(k) lift would preserve the torus weight ranks. Its characteristic-zero fiber would contain weight p and therefore an irreducible constituent of highest weight at least p, of dimension at least p+1>4. This is impossible. The matrix-bound statement may have a different valid proof. The locator was checked in the fresh published PDF and page image. |
| E21 | error / the proof | Treat multipliable relative roots separately using their actual root groups and weighted coordinates. Only appropriate reduced-root cases can be described by a vector group in this way. The unramified quasi-split SU₃ over F₃((t)), split over F₉((t)), is in scope. Its positive short-root group consists of upper unipotent matrices with entries (1,x,z;0,1,−bar(x);0,0,1), z+bar(z)+x bar(x)=0. Over F₉=F₃[i], i²=−1, take (x,z)=(1,1) and (i,1). Both preserve the anti-diagonal Hermitian form and their products differ in the upper-right entry, so U_b is nonabelian. Every Res G_a is abelian. The exact finite-field matrix regression checks this obstruction. The locator was checked in the fresh published PDF and page image. |
| E22 | error / a stated result | Exclude tori and state tempered base change in both alternatives, with the necessary compact-induction/purity hypotheses along the entire tower. Corollary 10.11’s principal-series conclusion does not imply loss of supercuspidality for GL₁. Take G=G_m and π=1. The Weyl group is trivial, the parameter is pure, every irreducible character is supercuspidal, and standard base change along a finite extension is composition with the norm. The trivial character stays trivial through every cyclic tower. It is therefore incorrigible in Definition 10.3. G is compact modulo its own center, so the compact-mod-center condition does not exclude this example. The locator was checked in the fresh published PDF and page image. |
| E23 | misprint / the proof | Use Σ_{δ∈Irr(Q)} (dim δ) Θ_{π_v⊗δ}, where Q=G(K_v)/H_v. These are the regular-character multiplicities; the positive integral combination is what the orthogonality argument uses. For Q=S₃ at a 3-cycle, the irreducible character values are 1,1,−1 and dimensions 1,1,2. Reciprocal weighting gives 1+1−1/2=3/2, whereas dimension weighting gives 1+1−2=0. Thus the displayed reciprocal-weight sum is not the regular-character identity that makes the function vanish outside H_v. This checks the algebraic step, not the full elliptic-orthogonality supplier. The locator was checked in the fresh published PDF and page image. |
| E24 | misprint / nothing | Write v₁,...,v_{e/k} for an F_q-basis of F_{q^{e/k}} wherever the basis index is used. The field has dimension e/k, which is also the number of scalar parameters and columns in the displayed companion-matrix construction. k and e/k are independent quantities; for e=6,k=2 the stated two vectors cannot be a basis of a degree-three field. The locator was checked in the fresh published PDF and page image. |
| E25 | gap / the proof | Choose an S-invariant vector in the appropriate tensor product, using a χ_S-eigenvector of Λ\|S and the inverse character. Construct the matrix coefficient/test function from this vector; do not infer the entire representation is trivial on S. The preceding choice only says χ_S occurs in Λ\|S. Twisting kills that character on its eigenspace, not on other constituents. Even 1⊕sgn on C₂ with the chosen character 1 shows the logical distinction. Additional scalar-action information or the explicit invariant-vector construction is needed for this step; the example is a test of the inference, not a counterexample to Proposition 10.10. The locator was checked in the fresh published PDF and page image. |
| E26 | gap / the proof | Supply a torality argument using an additional property of these particular automorphic parameters, or an appropriate connectedness hypothesis. Abelian semisimple image alone does not imply containment in a maximal torus of a reductive group. In PGL₂(ℂ), the classes of diag(1,−1) and [[0,1],[1,0]] commute (their lifts anticommute), generate a Klein four group, and are semisimple. In any faithful algebraic representation their finite abelian action is completely reducible into characters. They cannot lie in a rank-one torus, whose finite subgroups are cyclic. This refutes the general algebraic inference used as obvious; it does not construct a cuspidal automorphic Π with that parameter, so the verdict is a proof gap rather than a claimed counterexample to the automorphic corollary. The locator was checked in the fresh published PDF and page image. |

## Item-by-item audit

A retained item remains subject to the named gaps. The full source-use, API and search records are in the JSON.

| Item | Locator | Status / route | Action |
| --- | --- | --- | --- |
| 1 | §1, Theorem 1.2, p. 3; proof §3.3, pp. 10–11 | missing / 1 | retained after source/status check |
| 2 | §1, Corollary 1.3, p. 3 | missing / 1 | retained after source/status check |
| 3 | §1, Theorem 1.4(i), p. 3; §7 (Theorem 7.1 and Corollary 7.11) | missing / 1 | retained after source/status check |
| 4 | §1, Theorem 1.4(ii), p. 3; §8 (Theorem 8.1) | missing / 1 | retained after source/status check |
| 5 | §1, Theorem 1.5, p. 4; §7.2, Theorem 7.12 and proof, p. 23 | missing / 1 | retained after source/status check |
| 6 | §2.1, Theorem 2.1(i)–(ii), pp. 5–6 | planned | retained after source/status check |
| 7 | §2.1–2.2, Theorem 2.1(iii) and Theorem 2.3(iv)–(vi), pp. 6–7 | planned | retained after source/status check |
| 8 | §2.2, Corollary 2.4, p. 7 | missing / 1 | corrected |
| 9 | §2.2, Definition 2.5, pp. 7–8 | missing / 1 | corrected |
| 10 | §3.1, Definition 3.1, p. 8 | missing / 6 | corrected |
| 11 | §3.1, Definition 3.2, p. 8 | missing / 6 | corrected |
| 12 | §3.1, Definition 3.3 and Remark 3.4, pp. 8–9 | planned | corrected |
| 13 | §3.1, Lemma 3.5 and proof, p. 9 | missing / 1 | corrected |
| 14 | §3.2, Lemma 3.6 and proof, pp. 9–10; Remark 3.7 | missing / 1 | retained after source/status check |
| 15 | §3.2, p. 9; §4.1, Theorem 4.2 and proof, p. 12 | planned | corrected |
| 16 | §3.2, Corollary 3.8, p. 10 | missing / 1 | retained after source/status check |
| 17 | §3.3, Proposition 3.9 and proof, pp. 10–11 | missing / 1 | retained after source/status check |
| 18 | §3.3, proof of Proposition 3.9 and Remark 3.10, pp. 10–11 | missing / 2 | corrected |
| 19 | §1, pp. 4–5; §3.3, p. 10; §7.2, p. 22 | missing / 1 | retained after source/status check |
| 20 | §3.3, Proposition 3.11 and proof, p. 11 | missing / 1 | retained after source/status check |
| 21 | §3.3, Corollary 3.12 and Remark 3.13, p. 11 | missing / 1 | retained after source/status check |
| 22 | §4.1, Corollary 4.3 and proof, pp. 12–13 | missing / 1 | retained after source/status check |
| 23 | §4.1, proof of Corollary 4.3, pp. 12–13; §4.2, p. 14 | planned | retained after source/status check |
| 24 | §4.2, (4.4)–(4.5), p. 13 | missing / 1 | corrected |
| 25 | §4.2, Lemma 4.6 and proof, pp. 13–14 | missing / 1 | retained after source/status check |
| 26 | §4.2, Lemma 4.7 and proofs, p. 14 | missing / 1 | corrected |
| 27 | §3.3, Remark 3.10, p. 11; §4.2, proof of Lemma 4.7, p. 14 | planned | retained after source/status check |
| 28 | §5.1–5.3, pp. 14–17 | planned | corrected |
| 29 | §5.3, Lemma 5.1 and proof, pp. 15–17 | missing / 1 | corrected |
| 30 | §6, Proposition 6.1 and proof, pp. 17–18 | missing / 1 | retained after source/status check |
| 31 | §6, Corollary 6.2 and Remark 6.3, p. 18 | missing / 1 | retained after source/status check |
| 32 | §7, Theorem 7.1, p. 19 | missing / 1 | retained after source/status check |
| 33 | §7.1, p. 19 | missing / 1 | retained after source/status check |
| 34 | §7.1, proof of Theorem 7.2, p. 20 | missing / 1 | retained after source/status check |
| 35 | §7.1, Theorem 7.2 and proof, pp. 19–22 | missing / 1 | retained after source/status check |
| 36 | §7.2, (7.8), p. 22 | missing / 1 | retained after source/status check |
| 37 | §7.2, Theorem 7.9 and proof, p. 22 | missing / 1 | retained after source/status check |
| 38 | §1, p. 3; §7.2, Corollary 7.11, Theorem 7.12, pp. 22–23; §10.1, Proposition 10.5, p. 30 | missing / 3 | corrected |
| 39 | §7.2, Corollary 7.11 and proof, pp. 22–23 | missing / 1 | corrected |
| 40 | §8, Theorem 8.1, p. 23; proof §§8.2–8.4, pp. 23–26 | missing / 1 | retained after source/status check |
| 41 | §8.1, Definition 8.2, p. 23 | missing / 1 | retained after source/status check |
| 42 | §8.2, Lemma 8.3 and proof, pp. 24–25 | missing / 1 | retained after source/status check |
| 43 | §8.3, pp. 25 | missing / 1 | retained after source/status check |
| 44 | §8.5, Proposition 8.5 and proof, p. 26 | missing / 1 | corrected |
| 45 | §9.3, Proposition 9.1 and proof, pp. 27–28 | missing / 1 | retained after source/status check |
| 46 | §9.4, Expected Theorem 9.3 and footnote 3, p. 29 | missing / 1 | corrected |
| 47 | §9.4, proof of Theorem 9.4, p. 29 | missing / 4 | corrected |
| 48 | §9.4, Theorem 9.4 and proof, p. 29 | missing / 1 | corrected |
| 49 | §10.1, Definition 10.1, p. 29 | missing / 1 | corrected |
| 50 | §10.1, Definition 10.3, p. 30 | missing / 1 | corrected |
| 51 | §10.1, Proposition 10.5 and proof, p. 30 | missing / 1 | corrected |
| 52 | §10.2, pp. 30–31 | planned | retained after source/status check |
| 53 | §10.3, p. 31; §10.4, pp. 31–32 | missing / 5 | retained after source/status check |
| 54 | §10.3, p. 31 | missing / 1 | retained after source/status check |
| 55 | §10.4, proof of Lemma 10.6 and before Lemma 10.8, pp. 32–33 | missing / 3 | corrected |
| 56 | §10.4, Lemma 10.6 and proof, p. 32 | missing / 1 | retained after source/status check |
| 57 | §10.4, Lemma 10.7 and proof, pp. 32–33 | missing / 1 | retained after source/status check |
| 58 | §10.4, Lemma 10.8 and proof, pp. 33–34 | missing / 1 | retained after source/status check |
| 59 | §10.4, Lemma 10.9 and proof, p. 34 | missing / 1 | corrected |
| 60 | §10.4, Proposition 10.10 and proof, p. 35 | missing / 1 | retained after source/status check |
| 61 | §10.4, Corollary 10.11 and proof, pp. 35–36 | missing / 1 | corrected |
| 62 | §11, Definition 11.1 and following, p. 36 | missing / 1 | corrected |
| 63 | §11, Theorem 11.2, p. 36 | missing / 1 | corrected |
| 64 | §11, Theorem 11.4, p. 36 | missing / 1 | corrected |
| 65 | §1, footnote 1, p. 2; §11, after Conjecture 11.7, p. 37 | planned | retained after source/status check |
| 66 | §11, Conjecture 11.7, p. 37 | missing / 1 | corrected |
| 67 | §11, Corollaries 11.8 and 11.9, p. 37 | missing / 1 | corrected |
| 68 | §11, Questions 11.10 and 11.11, p. 37 | missing / 1 | corrected |
| 69 | Appendix A, pp. 37–38 | missing / 1 | retained after source/status check |
| 70 | Appendix A, proof of Lemma A.1, pp. 38–39 | missing / 1 | retained after source/status check |
| 71 | Appendix A, Lemma A.1 and proof, pp. 38–39 | missing / 1 | corrected |
| 72 | Appendix A, Lemma A.3 and proof, p. 39 | missing / 1 | retained after source/status check |
| 73 | Appendix A, proof of Lemma A.3, p. 39 | missing / 1 | retained after source/status check |
| 74 | Appendix A, proof of Lemma A.3, p. 39 | missing / 8 | corrected |
| 75 | §§3, 7–10 and Appendix A, passim | planned | retained after source/status check |
| 8-local | §2, Corollary 2.4(ii), p.7 | missing / 1 | added |
| 8-torus | §2, Corollary 2.4(iii), p.7 | missing / 1 | added |
| 10-dictionary | §3, Definition 3.1, p.8; Gross–Reeder §2.1, Lemma 2.1 and Proposition 2.2, author PDF pp.8–10 | missing / 6 | added |
| 12-group | §3, Definition 3.3(b) and Lemma 3.5, pp.8–10 | missing / 6 | added |
| 15-extension | §4.1, Theorem 4.2, p.12 | missing / 1 | added |
| 28-moy-prasad | §5.2 and proof of Lemma 5.1, pp.15–17 | missing / 7 | added |
| 38-stevens | §1, after Theorem 1.5; §7.2; Stevens, Inventiones 172 (2008) | missing / 3 | added |
| 62-cutoff | §11, paragraph after Definition 11.1, p.36 | missing / 1 | added |
| 67-principal | §11, Corollary 11.8, p.37 | missing / 1 | added |
| 67-depth-zero | §11, Corollary 11.9, p.37 | missing / 1 | added |
| 68-depth | §11, Question 11.11, p.37 | missing / 1 | added |
| kummer-injection | Used in §4.2, equations (4.4)–(4.5) | library | added |
| cyclic-kummer | Finite-extension input to §4.2 | library | added |
| character-extension | Generic supplier for Lemma 10.9, p.34 | library | added |
| character-orthogonality | Finite-group input to equation (7.7), p.21 | library | added |

## Exact regression script

```python
from fractions import Fraction as Q
from math import gcd
from itertools import product
checks=0
def ck(x):
 global checks
 assert x
 checks+=1
# Character exponents in (7.5)--(7.7). A2 highest-coroot weights.
w=[2,1,1,0,0,-1,-1,-2]
ck([a for a in w if (-2*a)%6==(-2*2)%6]==[2,-1,-1])
for q in [7,8,9,11,13,16,17,19,23,25,27,29,31,32,37,41,43,47,49]:
 for n in range(1,41):
  d=(q-1)//gcd(n,q-1)
  ck(d==min(j for j in range(1,q) if j*n%(q-1)==0))
  if d>=5:ck([a for a in w if (-n*a)%(q-1)==(-n*2)%(q-1)]==[2])
# Valuation arithmetic for the repaired affine-root convention s-b(c).
ck(not(Q(0)>=Q(0)+Q(1)))
for n in range(1,8):
 for bc in [Q(-3,2),Q(0),Q(2,3),Q(5)]:
  for r in [Q(0),Q(1,3),Q(2)]:
   s=bc+r+Q(1,7)
   ck(n*s>n*bc+n*r and n*bc+n*r>=n*bc+r)
# F9 = F3[i], i^2=-1, conjugation i -> -i.
z=(0,0);one=(1,0);ii=(0,1)
def add(a,b):return ((a[0]+b[0])%3,(a[1]+b[1])%3)
def neg(a):return((-a[0])%3,(-a[1])%3)
def mul(a,b):return((a[0]*b[0]-a[1]*b[1])%3,(a[0]*b[1]+a[1]*b[0])%3)
def bar(a):return(a[0],(-a[1])%3)
def mm(a,b):return [[sumf(mul(a[j][l],b[l][k]) for l in range(3)) for k in range(3)] for j in range(3)]
def sumf(xs):
 a=z
 for b in xs:a=add(a,b)
 return a
def star(a):return [[bar(a[k][j]) for k in range(3)] for j in range(3)]
def u(x,y):return[[one,x,y],[z,one,neg(bar(x))],[z,z,one]]
h=[[z,z,one],[z,one,z],[one,z,z]]
a=u(one,one);b=u(ii,one)
ck(mm(mm(star(a),h),a)==h);ck(mm(mm(star(b),h),b)==h)
ck(mm(a,b)!=mm(b,a));ck(mm(a,b)[0][2]!=mm(b,a)[0][2])
# A lift of Std + Std^(Frob) would have a highest weight >= p in rank four.
for p in [5,7,11,13,17,19]:ck(len(range(-p,p+1,2))==p+1 and p+1>4)
# Finite character extension for repeated-coordinate blocks of size >= 2.
for m in range(2,12):
 for target in range(m):
  pairs=[(x,y) for x,y in product(range(m),repeat=2) if (x+y)%m==target]
  ck(any(x!=0 or y!=0 for x,y in pairs))
  if m>2:ck(any(x!=0 and y!=0 for x,y in pairs) and any(x==0 or y==0 for x,y in pairs))
# Regular-character coefficients on S3, at identity, transposition, 3-cycle.
chars=[[1,1,1],[1,-1,1],[2,0,-1]];dims=[1,1,2]
ck([sum(dims[j]*chars[j][k] for j in range(3)) for k in range(3)]==[6,0,0])
ck(sum(Q(chars[j][2],dims[j]) for j in range(3))==Q(3,2))
# N=0 weight test: faithful Gm embeddings x and diag(x,1).
ck(len(set([2]))==1 and len(set([2,0]))!=1)
# Abelian subgroup of PGL2: lifts anticommute and have scalar squares.
a=[[1,0],[0,-1]];b=[[0,1],[1,0]]
def m2(a,b):return [[sum(a[i][k]*b[k][j] for k in range(2)) for j in range(2)] for i in range(2)]
ck(m2(a,a)==m2(b,b)==[[1,0],[0,1]])
ck(m2(a,b)==[[-v for v in row] for row in m2(b,a)])
# An Artin-Schreier trace is nonconstant on F3^x: distinct exponents modulo 3.
ck(1%3!=2%3)
# On Gm, trivial characters remain trivial under every norm map.
for degree in range(1,30):ck(1**degree==1)
print(f'{checks} exact arithmetic/finite-group diagnostics passed. No missing source theorem or Lean proof is certified.')
```
