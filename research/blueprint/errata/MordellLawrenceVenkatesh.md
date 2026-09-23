# Lawrence–Venkatesh source findings, independently reviewed

Source: Brian Lawrence and Akshay Venkatesh, *Diophantine problems and p-adic
period mappings*, Inventiones mathematicae **221** (2020), 893–999,
[DOI 10.1007/s00222-020-00966-7](https://doi.org/10.1007/s00222-020-00966-7).
The comparison uses [arXiv v3](https://arxiv.org/pdf/1807.02721v3) and the
[public copy of the published PDF](https://bimsa.net/doc/publication/2578.pdf).

Original findings E1–E20: Claude Code, session `cc-7b31c4`.
Independent review and E21–E28: Codex, session `codex-hjdg0j`,
`REV-ERRATA-DESIGN-LV`, 23 September 2026.

The review confirms 14 of the 20 original findings, sometimes with a narrower
reach or a corrected explanation, and rejects E4, E6, E9, E16, E18 and E20.
It adds eight checked findings. Of the 22 confirmed entries, E19 was already
corrected in the journal; 21 have no correction found in the searches made.
“New” means not found corrected in those searches, not a priority claim.

The source-level corrections below do not certify the closure of the roadmap
packet, which remains outside this review's deliverables. In particular E7,
E25 and E28 identify limits of particular written arguments. No counterexample
to either principal Diophantine theorem is asserted. The report records the
source hashes, the search limitations and the independent calculations.

## Findings and verdicts

In the following, “v3” denotes arXiv:1807.02721v3; journal page numbers are
printed page numbers, not PDF offsets. Short displayed excerpts retain the
relevant symbols; the surrounding assertion is described in the explanation.
Rejected entries remain identifiable in the JSON for the review audit trail.


### E1. Main-result label — confirmed

**Locator:** §1.6, arXiv v3 p. 7; published p. 902; compare Theorem 10.1 on published p. 969.

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `Proposition 10.1`

**Correction or disposition:** Theorem 10.1.

**Check:** The introduction calls the numbered main result a proposition, while the result is labelled Theorem 10.1.

**Independent verdict:** Confirmed in both PDFs. Corrected the original locator from §1.5 to §1.6. The optional word proper clarifies the introduction but its absence is not itself a false assertion.



### E2. Ramification at p in the finiteness applications — confirmed

**Locator:** §2.3, Lemma 2.3: arXiv v3 p. 9, standing notation p. 8; published pp. 902–904. Applications in §§3.4, 4.3, 6.

**Recorded classification:** misprint; reaches the proof.

**Relevant printed notation:** `ρ is unramified outside S`

**Correction or disposition:** Use a finite set T = S ∪ {w : w divides p} in the finiteness lemma and its applications; impose its Frobenius weight and integrality conditions away from T.

**Check:** The standing S excludes every place above p. Good reduction makes p-adic cohomology crystalline there, but does not make it unramified. For example H²_et(P¹,Q_p)=Q_p(−1) is ramified at p although P¹ has good reduction. The finiteness argument allows any fixed finite ramification set: enlargement to T is harmless.

**Independent verdict:** Confirmed as an application-domain misprint affecting the proof, not a counterexample to the finite-set finiteness lemma. Checked the cohomological applications and added the necessary exclusion of T in conditions (b),(c), as well as in (a).



### E3. Local units versus the whole multiplicative group — confirmed

**Locator:** §2.4, Lemma 2.8: arXiv v3 p. 12; published p. 908.

**Recorded classification:** error; reaches a stated result.

**Relevant printed notation:** `η²|_{K_v^*} = χ · Norm_{K_v/Q_p}^w`

**Correction or disposition:** The identity holds on the local units: η²|_{O_{K_v}^*} = χ · Norm_{K_v/Q_p}^w with χ of finite order. It does not hold on all of K_v^*. The final sentence — w even, Hodge–Tate weight w/2 at v — is correct, and is what Lemmas 2.9 and 2.10 use.

**Check:** Counterexample: K = Q (which has no CM subfield, so every finite place is friendly), v = p, η = χ_cyc^{-1}. Then η is ramified only at p, locally algebraic there, and pure of weight w = 2, since geometric Frobenius at ℓ acts by ℓ. As an idele class character η(p) = 1, because the local Artin image of a uniformizer acts trivially on μ_{p^∞} in either normalisation; so η²(p) = 1 while Norm_{Q_p/Q_p}(p)^w = p², and χ(p) = p^{-2} has infinite order. On units η(u) = u and η² = Norm², so the identity does hold there. The proof cannot give more: local algebraicity is the hypothesis that η_p 'agrees, in a neighbourhood of the identity, with the Q_p-points of an algebraic homomorphism' (p. 12), and the closing step — 'any Q_p-rational character of (Res_{E/Q} G_m)^1 is trivial upon pullback to E_v^*' — is a statement about that algebraic character, hence controls η only on an open subgroup of E_v^*, not on a uniformizer.

**Independent verdict:** Confirmed in both versions by the cyclotomic counterexample. Local algebraicity controls an open subgroup of the units, not an unramified value on a uniformizer. The finite-order discrepancy extends over the compact unit group. The final Hodge–Tate conclusion, and the uses of that conclusion, do not require the false whole-multiplicative-group identity.



### E4. Goursat argument — rejected

**Locator:** §2.7, Lemma 2.12: arXiv v3 p. 14; published p. 911.

**Recorded classification:** gap; reaches nothing. This classification is rejected with the finding.

**Relevant printed notation:** `sp_V is simple`

**Correction or disposition:** No mathematical correction is required for the alleged omitted Goursat argument. The distinct-index misprint is separately recorded as E22.

**Check:** The original entry treated the brief Goursat argument as inadequate. Its proposed proof is a standard expansion of the two structural facts already stated by the authors.

**Independent verdict:** Rejected. Over an algebraic closure, a subdirect Lie subalgebra of a product of simple sp factors is a product of diagonals. For a linked pair, innerness makes the connected image a graph of an inner automorphism. Every element normalizes that graph, so its two projections differ, after conjugation, by a central sign. If both are unipotent the sign is +1, forcing equal fixed-space dimensions. The stated distinguishing element excludes every linked pair; full Lie algebra gives the full connected product, and descent follows. This also handles a disconnected G. V=0 is immediate. No proof from the unchecked packet is needed.



### E5. The coefficient field of V_v — confirmed

**Locator:** §3.3: arXiv v3 p. 17; published p. 916.

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `V_v = H^q_dR(X_0/K)`

**Correction or disposition:** V_v = H^q_dR(X_0/K_v): the subscript is missing on K.

**Check:** Equation (3.4) on p. 16 sets V = H^q_dR(X_0/K) and then defines V_v as V ⊗_K K_v, and the diagram (3.9) immediately above the quoted sentence has V_v = H^q_dR(X_{y_0}/K_v). A σ-semilinear φ_v for the Frobenius σ of K_v/Q_p does not act on the K-form V at all, so the sentence as printed is not even well posed; the intended object is the K_v-space.

**Independent verdict:** Confirmed in both PDFs against (3.4) and (3.9): V_v is obtained by extension to K_v. This is a missing subscript, with no change to the intended mathematics.



### E6. Common convergence radius — rejected

**Locator:** §3.4, Lemma 3.2: arXiv v3 p. 18; published p. 917.

**Recorded classification:** misprint; reaches the proof. This classification is rejected with the finding.

**Relevant printed notation:** `U_v = {z : |z_i|_v < ε}, U_C = {z : |z_i|_C < ε}`

**Correction or disposition:** No correction is necessary. Allowing separate radii is an optional generalization.

**Check:** The original objection required the small disk in Lemma 3.2 to equal the entire residue disk in the later application. That is unnecessary for a lower bound on the Zariski closure of the image.

**Independent verdict:** Rejected. Choose ε smaller than both convergence radii. The complex monodromy lower bound still holds on this smaller nonempty neighborhood, by Lemma 3.1. Lemma 3.2 transfers it to the smaller v-adic disk, whose image is contained in the image of the whole residue disk. Equivalently, the ideal of polynomial relations among the power series does not depend on shrinking the radius. The independent field-order misprint is E23.



### E7. Analytic scope at residue characteristic 2 — confirmed

**Locator:** Proposition 5.3 and §6: arXiv v3 pp. 26, 29, compared with §§3.1, 3.3, pp. 15–17; published pp. 927, 931–932.

**Recorded classification:** gap; reaches the proof.

**Relevant printed notation:** `v ∉ S`

**Correction or disposition:** To apply §3 literally, explicitly restrict to odd residue characteristic and to the §3 good-reduction setup. For the proposition as stated at p=2, replace the whole residue disk by finitely many smaller congruence disks and carry out the argument on each. No counterexample to Proposition 5.3 is asserted.

**Check:** Friendliness ensures K_v/Q_p is unramified, but does not imply p>2. The quoted estimate for flat sections is |z|<p^(−1/(p−1)). At p=2, points with |z|=1/2 in a residue disk are on its boundary, so that estimate does not justify §6’s assertion that the analytic domain contains the entire residue disk. Subdivision into disks modulo 4 avoids this issue. The original claim that other primes above p must be good for crystallinity at v was incorrect: v∉S already supplies good reduction at v.

**Independent verdict:** Confirmed only as a mismatch in the written proof’s analytic scope; narrowed from a stated-result defect. The whole-disk assertion persists in the journal. Excluding the finitely many rational primes below S and 2 is sufficient for the main theorem’s choice of v. Retaining Proposition 5.3’s full scope needs the smaller-disk argument; if good reduction at other p-adic places is not assumed, its averaging step uses the Hodge–Tate/de Rham version of Lemma 2.10. The present review does not claim that every such extension is already proved in the paper.



### E8. The orbit-size endpoint — confirmed

**Locator:** Proof of Theorem 5.4: arXiv v3 pp. 27–28; published pp. 929–930.

**Recorded classification:** misprint; reaches the proof.

**Relevant printed notation:** `1 ⩽ i ⩽ 8`

**Correction or disposition:** 1 ⩽ i ⩽ 7 in both unions, and 'orbits of size less than 8' in the last clause. The displayed bound 8 · 2^g (q − 1)^g is unchanged (it is then a bound for seven submodules, so a fortiori valid), and so is the rest of the proof.

**Check:** size_v counts the elements lying in Frobenius orbits of size < 8 (Definition 5.2), that is, the elements killed by T^i − 1 for some i ⩽ 7; i = 8 is not needed. It is also not available: the next step reads 'For every odd prime factor r of q − 1 we know that q_v^i is not congruent to 1 modulo r', and that is precisely condition (iii) imposed on v two pages earlier, that the class of q_v in (Z/r)^* has order at least 8. An order exactly 8 is allowed, and then q_v^8 ≡ 1 mod r, so (q_v^8 − 1) need not be prime to r and the conclusion 2⟨m_1, m_2⟩ = 0 fails for i = 8. With i ⩽ 7 every step is correct.

**Independent verdict:** Confirmed in both versions. Order at least 8 only excludes q_v^i=1 for i=1,…,7. As an exact check, q=83, q−1=82, r=41 and q_v=3 give order 8 modulo 41. The symplectic similitude diag(I_3,55 I_3) over Z/82 has eighth power 1, while twice the standard pairing is nonzero. This checks the failed inference under the displayed order condition; it does not claim realization of this matrix as a particular curve’s Frobenius. Restricting to i≤7 proves the needed bound.



### E9. The finite union of bad loci — rejected

**Locator:** Proof of Lemma 6.1: arXiv v3 p. 32; published p. 937.

**Recorded classification:** error; reaches the proof. This classification is rejected with the finding.

**Relevant printed notation:** `Fix any (y′_0,w)`

**Correction or disposition:** No mathematical correction is necessary; explicitly writing the finite union would improve exposition.

**Check:** The original entry read an arbitrary pair as a single pair which must capture every bad point. The argument is uniform in the chosen pair.

**Independent verdict:** Rejected. Let I be the finite set of pairs above (y_0,v) of local degree at least 8, and let B_i be the bad points for pair i. The sublemma gives Bad ⊂ ⋃_{i∈I} B_i. The paragraph fixes an arbitrary i and proves B_i finite; repeating the same argument for every element of the finite I proves Bad finite. This standard finite-union reduction requires no new mathematical input.



### E10. Nonzero proper subspaces and a nonempty open — confirmed

**Locator:** Definition of H^bad and Lemma 6.3: arXiv v3 pp. 32–33; published pp. 937–938.

**Recorded classification:** misprint; reaches the proof.

**Relevant printed notation:** `dim(F ∩ W) ⩾ ½ dim(W)`

**Correction or disposition:** Require 0≠W≠V in the bad-locus definition and in Lemma 6.3, and specify that its open subset A is nonempty. Compatibility of φ with the form in the proof is a separate issue, E25.

**Check:** Both W=0 and W=V are φ-stable and satisfy the printed inequality for every Lagrangian F. Consequently the literal bad locus is the entire parameter space. The printed lemma also allows A=∅, so read literally it is vacuous rather than false. Lemma 6.4 and the preceding sublemma use nonzero proper W.

**Independent verdict:** Confirmed in both PDFs. Added the nonemptiness requirement and removed the original blanket assertion that these edits alone make the printed proof complete: E25 concerns a different omitted compatibility.



### E11. The branch point on Y — confirmed

**Locator:** §7.1, Proposition 7.1(ii): arXiv v3 p. 35; published p. 940.

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `π_1^geom(Y − y′,y_0)`

**Correction or disposition:** π_1^geom(Y − π(y'), y_0).

**Check:** y' is a point of Y', not of Y, so 'Y − y'' is not defined. The preceding sentence says the cover Z_{y'} → Y is ramified exactly at π(y'), and part (i) attaches to y' a conjugacy class of surjections π_1^geom(Y − y, *) ↠ G with y = π(y'); so the group meant is the one of the punctured curve Y − π(y').

**Independent verdict:** Confirmed in both versions. The point y′ belongs to Y′ and its image π(y′) is the branch point on Y. The preceding sentence identifies the intended puncture.



### E12. The second homotopy group of the base — confirmed

**Locator:** §7.3, proof of Lemma 7.4: arXiv v3 p. 38; published p. 945.

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `π_2 of Y − {y_0}`

**Correction or disposition:** '… because the π_2 of Y vanishes': the relevant group is π_2 of the base of the fibration, not of its fibre.

**Check:** The fibration is the second map of (7.5), (Y² − Δ, y) → (Y, y_0), (y, y') ↦ y', whose fibre over y_0 is Y − {y_0}. Its long exact sequence reads π_2(Y) → π_1(Y − {y_0}) → π_1(Y² − Δ) → π_1(Y) → π_0, so injectivity on the left is governed by π_2 of the base Y; π_2 of the fibre enters the sequence one step earlier and is irrelevant to it. The conclusion is correct because Y is a closed surface of genus ⩾ 2, hence aspherical, so π_2(Y) = 0 — and in any case only the middle exactness, which gives the normality of Γ in Γ̃^geom that the argument goes on to use, is needed.

**Independent verdict:** Confirmed as a base/fiber slip. Narrowed the reach to nothing: both surfaces are aspherical in the stated genus range, so the intended exact sequence is correct. Moreover the ensuing normality argument uses middle exactness, which does not need the asserted injectivity.



### E13. Nonseparating curves in Lemma 8.2 — confirmed

**Locator:** §8.3, Lemma 8.2: arXiv v3 p. 42; published p. 951.

**Recorded classification:** error; reaches a stated result.

**Relevant printed notation:** `[e_1], …, [e_k]`

**Correction or disposition:** Require e to be nonseparating in Y, equivalently [e] ≠ 0 in H_1(Y; Q).

**Check:** A simple curve bounding a disk away from the branch point is permitted by the paper’s definition. Its q inverse images bound disks, so all q homology classes are zero, contradicting the claimed independence and primitive rank q−1. For a nonseparating curve one can choose the one-face CW decomposition used in the proof; the lifted edge classes are independent and transfer supplies the single relation after primitive projection. The required distinguishing curves can be chosen nonseparating, including curves with q-cycle monodromy; they are not all liftable curves in the paper’s special sense.

**Independent verdict:** Confirmed in both versions by the disk counterexample. Corrected the application discussion: liftable curves are nonseparating, but the later distinguishing argument also uses non-liftable curves. That argument needs the nonseparating choices described in the report, not the claim that all applications are automatically liftable.



### E14. Curve hypotheses and the twist power — confirmed

**Locator:** §8.3, Lemma 8.3: arXiv v3 p. 42; published p. 951.

**Recorded classification:** error; reaches a stated result.

**Relevant printed notation:** `rank(Mon(D_e^M) − Id)`

**Correction or disposition:** Take a nonseparating simple closed curve e in Y−{y} and a positive sufficiently divisible M (for example a positive multiple of the order of Cov(e), and of the relevant stabilizer indices). Then the rank is k−1, where k is the number of cycles of Cov(e).

**Check:** The lemma is deduced from Lemma 8.2, which needs e nonseparating (finding E13), and it fails without that hypothesis. If e bounds a disk in Y − {y} then Mon(D_e^M) = Id and the rank is 0, while Cov(e) = 1; if e is nonseparating with Cov(e) a q-cycle then k = 1 and the rank is again 0. Two different conjugacy classes give the same rank, so the rank does not determine the class. With e nonseparating the three possible cycle types in Aff(q) — (1^q), (q) and (1, r, …, r) — have k = q, 1 and 1 + (q − 1)/r cycles respectively, all distinct, and the lemma holds. The applications, in the proof of Lemma 8.9, are to nonseparating curves.

**Independent verdict:** Confirmed in both PDFs. Besides the missing nonseparating/puncture condition, M=0 is allowed by the literal stabilizer condition and makes every rank zero. A positive sufficiently divisible power is a safe corrected statement: its lift is a product of positive twists and has rank k−1 on primitive homology. The affine cycle types have distinct counts q, 1, and 1+(q−1)/r for r>1. This correction is sufficient for the use of powers in Lemma 8.7.



### E15. The punctured mapping class group — confirmed

**Locator:** Lemmas 8.3, 8.9: arXiv v3 pp. 42, 47; published pp. 951, 958.

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `MCG(Y)_Z; MCG(Y)_{Z_i}`

**Correction or disposition:** MCG(Y − {y})_Z and MCG(Y − {y})_{Z_i}.

**Check:** The covers Z_i of §8 are the singly ramified Aff(q)-covers of (Y, y): covers of Y − {y}, classified by homomorphisms π_1(Y − {y}) → Aff(q), and it is the mapping class group of the punctured surface that acts on the set of them. §8.2 defines MCG(Y − {y})_0 as the intersection of the groups MCG(Y − {y})_{Z_i} (p. 40) and it is that group which carries the monodromy map (8.3) and appears in Lemma 8.7; Lemma 8.9 is invoked to prove Lemma 8.7 ('We are now reduced to proving Lemma 8.9'), so the same group is meant. §8.3 itself says of a curve e in Y − {y} that 'we can regard D_e as an element of MCG(Y − {y})'. Nothing but the abbreviation is at fault.

**Independent verdict:** Confirmed as inconsistent puncture notation, not a new monodromy theorem. The local Y in these statements is the compact surface, while the actual cover-stabilizing group and the preceding Birman sequence retain the branch point.



### E16. The proof in footnote 6 — rejected

**Locator:** §8.5, Lemma 8.6 and footnote 6: arXiv v3 p. 46; published p. 956.

**Recorded classification:** gap; reaches nothing. This classification is rejected with the finding.

**Relevant printed notation:** `simple topological proof`

**Correction or disposition:** No mathematical correction is required to supply a proof: footnote 6 already gives an alternative argument. Its dangling reference is E17.

**Check:** The original entry discounted the footnote because it is a sketch and uses algebraic geometry. Those facts do not make its standard argument inadequate.

**Independent verdict:** Rejected. If the primitive monodromy is central, its image is finite (contained in ±1); a finite cover kills it, and the pullback of H¹(Y) is already constant. The fixed-part theorem makes the entire polarized Hodge structure constant. Torelli makes the fibers Z isomorphic; after finite base change one can fix Z. Their nonconstant maps to the fixed genus≥2 curve Y then contradict de Franchis finiteness, since the single branch point varies with the nonconstant finite map Y′→Y. This verifies the argument actually printed, independently of the packet’s topological replacement.



### E17. The dangling part reference — confirmed

**Locator:** §8.5, footnote 6: arXiv v3 p. 46; published p. 956 (also visible in Springer’s article preview).

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `(a)`

**Correction or disposition:** 'If the conclusion of the lemma were false' — or simply delete the clause, since the argument has already said 'Suppose to the contrary'.

**Check:** Lemma 8.6 has no labelled parts and the footnote is proving its single conclusion. The reference to (a) has no local antecedent. Lemma 8.10 later does have a part (a), so the original assertion that no neighboring §8 statement has one was too broad.

**Independent verdict:** Confirmed and narrowed to the dangling local reference. Its historical origin is unknown; no claim that an earlier draft contained a corresponding part has been verified.



### E18. The exponent in the distinguishing-curve figure — rejected

**Locator:** §8.5, Lemma 8.8 and Figure 4: arXiv v3 pp. 47–48; published pp. 957–958.

**Recorded classification:** gap; reaches the proof. This classification is rejected with the finding.

**Relevant printed notation:** `β_1β_2β_1^{−1}β_2^{q−c_1}; β_1β_2β_1^{−1}β_2²`

**Correction or disposition:** No mathematical correction is required solely because the illustrative figure uses exponent 2. A parametric Dehn-twist description can make the construction more explicit.

**Check:** The original entry correctly notices the special exponent in the caption, but a diagram illustrating one member of a routine family is not by itself a gap.

**Independent verdict:** Rejected after checking the general construction. Close two disjoint torus arcs, lying on opposite sides of the puncture, by arcs on the extra handle crossing once. The resulting simple curves d,x intersect once and collapse to β_2 and β_1β_2β_1^{-1}. Twisting x about d preserves simplicity and gives, up to conjugacy and orientation, β_1β_2β_1^{-1}β_2^m. Choose m=q−c_1; its affine images translate by 0 and c_2−c_1. The extra-handle homology component has coprime coordinates (1,m), so the curve is nonseparating. The figure’s special exponent does not obstruct this standard variation. The arithmetic was separately checked for 2666 generator pairs; that check alone is not a proof of topological existence.



### E19. Figure references already corrected in print — confirmed

**Locator:** §8.5 and §8.6: arXiv v3 pp. 47, 50; corrected in the published version pp. 958, 961.

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `Figure 8.5; Figure 8.6`

**Correction or disposition:** 'see Figure 4' and 'see Figure 5' respectively.

**Check:** The arXiv PDF refers to nonexistent figure numbers rather than Figures 4 and 5. At these two references, the corresponding source labels precede the captions and capture the wrong counter. This is not a claim that these are the only labels before captions in the source.

**Independent verdict:** Confirmed for arXiv v3; changed known from new to the published correction after direct inspection of both journal pages. The original inability to access Springer did not establish that the journal retained the mistake.

**Already corrected:** Corrected in the published article, Invent. Math. 221 (2020), DOI 10.1007/s00222-020-00966-7, pp. 958 and 961: the references are Figures 4 and 5.


### E20. Simple basis curves from Dehn twists — rejected

**Locator:** §8.6, proof of Lemma 8.11: arXiv v3 p. 49; published p. 959.

**Recorded classification:** gap; reaches the proof. This classification is rejected with the finding.

**Relevant printed notation:** `β_1β_2^j`

**Correction or disposition:** No mathematical correction is needed. Explain the usual Dehn-twist construction if more detail is desired.

**Check:** The original entry classifies a standard basis-curve construction as a gap solely because no separate proof or reference is printed.

**Independent verdict:** Rejected. Apply the j-th power of a Dehn twist about the second basis curve to the first. Choose the twist support away from the puncture and basepoint/boundary collar. It preserves simplicity and endpoint germs and changes the based word to β_1β_2^j, with the orientation chosen accordingly. This proves the asserted family for all j and the common local orientation used later.



### E21. The standing set of places — confirmed

**Locator:** §2, standing notation: arXiv v3 p. 8; published p. 902.

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `finite places`

**Correction or disposition:** Define S to be a finite set of places containing the archimedean places; delete the second occurrence of finite.

**Check:** A set consisting only of finite places cannot contain any archimedean place of a number field. The S-integer convention fixes the intended reading.

**Independent verdict:** New finding checked in both versions; a wording slip, distinct from E2’s missing p-adic ramification set.



### E22. Distinct indices in the product lemma — confirmed

**Locator:** §2.7, second hypothesis of Lemma 2.12: arXiv v3 p. 14; published p. 911.

**Recorded classification:** misprint; reaches the proof.

**Relevant printed notation:** `1 ⩽ i,j ⩽ N`

**Correction or disposition:** Add i≠j to the second hypothesis.

**Check:** For i=j, the two projected operators are identical and cannot have fixed spaces of different dimensions. The printed hypothesis is therefore impossible when N≥1, making the implication vacuous and unusable in Lemma 8.7. Pairwise distinct factors are intended.

**Independent verdict:** New finding confirmed in both PDFs and the source. The missing restriction is independent of the rejected demand for a longer Goursat proof in E4.



### E23. Swapped base-change fields — confirmed

**Locator:** §3.4, conclusion of Lemma 3.2: arXiv v3 p. 18; published p. 917.

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `K_v (respectively C); B_C(U_C) (respectively B_v(U_v))`

**Correction or disposition:** The base extension to K_v is the closure of B_v(U_v), and the base extension to C is the closure of B_C(U_C).

**Check:** The respective closures are subschemes of projective spaces over the opposite fields from those paired with them in the sentence. The proof constructs the common ideal over K and gives the correctly matched base changes.

**Independent verdict:** New finding checked visually in both versions; distinct from the rejected common-radius objection E6.



### E24. The missing power of a liftable Dehn twist — confirmed

**Locator:** End of §8.3: arXiv v3 p. 43; published p. 951.

**Recorded classification:** error; reaches the proof.

**Relevant printed notation:** `D_e`

**Correction or disposition:** Use D_e^{q−1}, or a suitable further positive multiple in the common cover stabilizer. Its lift is D_{e+}^{q−1}D_{e−}; it induces a nontrivial transvection on primitive homology.

**Check:** For a liftable e the multiplier of Cov(e) generates F_q^×. A dual curve meeting e once has its abelian multiplier changed by this generator under D_e. Conjugation in Aff(q) preserves multipliers, so D_e does not stabilize the cover. The preceding lifting formula instead applies to the (q−1)-st power. If u is the primitive projection of [e+], then the projection of [e−] is −u and the lift acts by x↦x+q⟨u,x⟩u, up to the intersection-sign convention.

**Independent verdict:** New finding confirmed in both PDFs against the preceding power-lifting formula. Since q≠0 in Q and u≠0 by the corrected Lemma 8.2, this power still supplies the one-parameter transvection subgroup in the Zariski closure. No change to the claimed monodromy target is inferred.



### E25. Transporting the symplectic form in Lemma 6.3 — confirmed

**Locator:** Lemma 6.3 and its reduction to Lemma 6.4: arXiv v3 p. 33; published pp. 937–938.

**Recorded classification:** gap; reaches the proof.

**Relevant printed notation:** `φ : V → V`

**Correction or disposition:** For the printed proof, require φ to be a semilinear similitude: ω(φx,φy)=c·σ(ω(x,y)) for some c≠0. Alternatively prove a general-position result for the different transported symplectic forms, rather than invoking Lemma 6.4 for one form.

**Check:** The printed assumptions make φ bijective and Frobenius-semilinear only. Identifying the embedding components V_i via φ need not make their Lagrangians Lagrangian for one common form. Over an unramified extension of degree 8, take φ=Aσ with A=diag(2,1,1,1) and the standard symplectic form pairing e_1,e_3 and e_2,e_4. F=span(e_1+e_2,e_3−e_4) is Lagrangian, but the pairing on A^{-1}F is −1/2. Thus the common-form hypothesis needed for the displayed invocation of Lemma 6.4 is not justified.

**Independent verdict:** New proof-scope finding confirmed in both versions by exact rational linear algebra. This is not a counterexample to the possible stronger conclusion after correcting E10. The geometric Frobenius in the application respects the polarization with its Tate factor, so the similitude hypothesis supplies the intended application.



### E26. Abelian dimension in the period Grassmannian — confirmed

**Locator:** §6, definition of G_v and H_v: arXiv v3 p. 29; published p. 932.

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `Gr(V_v,g); rank g`

**Correction or disposition:** Use Gr(V_v,d) and rank d, where d is the relative abelian dimension in Proposition 5.3. The coefficient algebra in that sentence is E_{0,v}.

**Check:** V_v has rank 2d over E_{0,v}; its first Hodge step and its Lagrangians have rank d. The letter g denotes the genus of the base curve and need not equal d: the Kodaira–Parshin formula gives d=(q−1)(g−1/2), for example d=3 when g=2,q=3.

**Independent verdict:** New finding checked in both PDFs against Proposition 5.3 and the definition of V_v. The subsequent proof uses d, confirming the intended rank.



### E27. The Galois group in the refinement — confirmed

**Locator:** §2.3, refined statement of Lemma 2.6: arXiv v3 p. 11; published p. 906.

**Recorded classification:** misprint; reaches nothing.

**Relevant printed notation:** `ρ : G_Q → L_Q(Q_p)`

**Correction or disposition:** Replace the domain by G_K.

**Check:** K is the number field fixed in the lemma; Q is its parabolic-subgroup variable. The refinement concerns the same representations of G_K, as the last paragraph of its proof also states.

**Independent verdict:** New finding confirmed in both versions; inspected the PDF subscript and the arXiv source.



### E28. The transporter double-coset finiteness claim — confirmed

**Locator:** §2.3, proof of Lemma 2.6: arXiv v3 p. 11; published pp. 906–907.

**Recorded classification:** error; reaches the proof.

**Relevant printed notation:** `(G(Q_p), L(Q_p))`

**Correction or disposition:** Parametrize conjugated representations using the right centralizer Z_{GL_n}(L)(Q_p), not L(Q_p). A complete finiteness proof then needs an appropriate finiteness result for embeddings/orbits, together with the component and rational-descent arguments; the bare transporter does not have the stated finite orbit set.

**Check:** Take G=SL_2⊂GL_2 and the trivial two-dimensional representation of G_K. It satisfies the unramified, integral, weight-zero hypotheses and has Zariski closure L={1}. Its transporter is all GL_2(Q_p), whose double quotient SL_2(Q_p)\GL_2(Q_p)/{1} is Q_p^× by determinant, hence infinite. There is nevertheless only one conjugated trivial representation. Right multiplication by the centralizer, which is all GL_2 here, is precisely what identifies conjugating matrices inducing the same representation.

**Independent verdict:** New finding checked directly in both versions. It disproves the intermediate assertion, not Lemma 2.6 itself. The review does not claim to have verified a replacement of the entire general reductive-group argument from Richardson’s cited theorem.



## Consequences and boundaries

For the cohomological finiteness applications, use S together with the primes
above p (E2). For the Hodge-weight argument, use the unit-group conclusion of
Lemma 2.8 (E3). For the bad-locus argument, use nonzero proper subspaces, a
nonempty open and the polarization-compatible Frobenius (E10, E25). The
residue-characteristic convention in E7 must also be made explicit when
reusing the analytic proof.

For monodromy, restrict Lemmas 8.2–8.3 to nonseparating curves away from the
branch point and use positive sufficiently divisible twist powers (E13–E14,
E24). In Lemma 8.8's first case, a primitive class in H₁(Y) gives a
nonseparating curve. In its cut-surface case, normalize the common boundary
image to 1, choose a handle class on which the two maps differ, and add a
boundary multiple so one image vanishes. The elementary boundary-class
construction of Lemma 8.4 supplies a curve with nonzero capped handle class,
hence nonseparating in Y. In the final case use the extra-handle twist
construction in E18. These choices are sufficient; “every application is
liftable” is not a valid explanation.

The bound r≥5 observed inside Lemma 6.4 is a strengthening of its stated r≥8
form, not an erratum. A roadmap may replace the paper's Legendre-family
monodromy or Torelli arguments by other proofs without making those printed
proofs erroneous. Likewise the rejected demands for expanded routine proofs
are not registered as new source mistakes.

E28 is deliberately limited: the displayed transporter-orbit assertion is
false even for the trivial representation. Replacing the quotient by the
correct one is necessary, but this report does not certify the remainder of
the general reductive-group finiteness proof.
