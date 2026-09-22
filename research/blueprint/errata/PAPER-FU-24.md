# Mistakes in Fu, *Sharp bounds for multiplicities of Bianchi modular forms*

Job ERRATA-PAPER-FU-24. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-FU-24.json` beside this file.

**Paper and version read.** Weibo Fu, Annals of Mathematics 200 (2024), 123–152, DOI 10.4007/annals.2024.200.1.3. The version read is arXiv 2201.11190v2 (15 February 2024, SHA-256 `d71e9d3f…2614`), as by the extraction. Every passage below was re-read there. The published text was not collated.

**Earlier work.** The extraction PAPER-FU-24 (partial) recorded seven findings, S1–S7, under `sourceIssues` in an older form. This file converts them to the form of PROTOCOL §18 as E1–E7, keeping everything they say in each entry's reason. The comparisons with Marshall (2012), Schneider–Teitelbaum (2003) and Ardakov–Wadsley (2013, 2014) are as the extraction recorded them. The statements in Fu's paper were checked here.

**Existing corrections.** None was found:
- the Annals page links no erratum;
- arXiv v2 is the latest version;
- a web search found nothing.

**Effect on the main results.** Theorem 1.2 (the bound (min k_i)^{−1}·Δ(k)) and Corollary 1.3 (Conjecture 1.1 for Bianchi forms) stand. The findings are a convention mismatch that needs a boundary estimate (E1), a wrong description of a completion (E2), an over-strong remark that leaves Theorem 1.5 resting on Ardakov–Wadsley (E3), a coefficient hypothesis (E4), a proof step left unproved (E5), an indexing slip (E6), and a domain statement that fails when the quotient is zero (E7).

---

## E1. Cuspidal versus compactly supported cohomology (gap; the proof)

Fu cites Marshall's Eichler–Shimura identity (2), dim H_c^{r1+r2}(Y(K_f), W_k) = 2^{r1} dim S_k(K_f), and describes the space as "compactly supported cohomology". In Marshall's paper H_c is cuspidal cohomology inside ordinary cohomology.

Corollary 1.3 then asserts dim H^n_c(Y(K_f), W_k) ∼ k for n = 1, 2. For genuinely compactly supported cohomology this needs a boundary estimate. For c cusps, |dim H^n_c − dim H^n| ≤ 3c, by a Koszul computation on the cusp tori with dimensions (1, 2, 1). The trivial coefficient system is treated separately. The difference is bounded, so the growth statement survives, but the paper does not give the step.

## E2. The completion D_r described by bounded coefficients (error; affects nothing)

Equation (16) defines D_r(G, K) as the completion of the distribution algebra for ‖·‖_r, and then describes it "as a K-Banach space" by the condition sup |λ_α| r^{|α|} < ∞. The completion consists of the series with |λ_α| r^{|α|} → 0; the bounded condition gives a strictly larger space. For example, r = p^{−1/p} with coefficients c_{pj} = p^{−j} gives a bounded sequence of weighted norm 1 that does not tend to zero. The inverse limit over all r is the same either way, so nothing later depends on this.

## E3. "Induced if and only if v(λ₀) ≥ 2" (error; the proof of Theorem 1.5 as announced)

Remark 5.8 claims that an infinitesimal character is induced from a torus character if and only if v(λ₀) ≥ 2, justified by dχ(p²h²) ∈ p²Z_p, which proves only one direction. The converse fails. For p = 3 and Casimir value 1, being induced would require a with a(a + 2)/2 = 1, that is (a + 1)² = 3, which has no solution in Q₃.

So §5, whose main Theorem 5.1 assumes λ induced, proves Theorem 1.5 only for induced λ, although §5 is announced as proving it for all λ ∈ Z_p^r. The general case follows from Ardakov–Wadsley [AW14, Theorems 4.6 and 5.4], as the paper also mentions, or by adjoining the needed roots in a finite coefficient extension.

## E4. The microlocal Ore set over a ramified coefficient ring (error; the proof)

The Ore set S₀ = ⋃_{a≥0} (p^a + m^{a+1}) of (17) is defined in R[[G]], with m its maximal ideal. If R is ramified then p ∈ m², so p + m² contains 0, and S₀ cannot be inverted. Ardakov–Wadsley work where p is a uniformizer. The construction should be carried out over Z_p, or an unramified coefficient ring, and then compared with the finite extension.

## E5. From a domain associated graded to a domain (gap; the proof)

The proof of Theorem 5.7 computes the associated graded of the central quotient D^λ_r for the filtration by ‖·‖_{r′} and concludes from the graded ring being a domain. That deduction needs the quotient filtration to be separated, which is not automatic: the test ring Q_p⟨T/R⟩/(T(T − a)) shows the hypothesis is essential for this kind of argument. The proof of Theorem 5.1 also leaves a topological PBW normal form to the reader.

The extraction proves the domain statement for integral parameters on the range p^{−1} ≤ r < p^{−1/(p−1)} and leaves the larger radii open.

## E6. An index and an asymptotic symbol (misprint)

The weight k = (k_1, …, k_{r1+r2}) has one entry per place, but Theorem 1.2 takes min_{1≤i≤r} k_i with r = r1 + 2r2 the field degree. The index should run over 1 ≤ i ≤ r1 + r2.

Corollary 1.3's "dim H^n_c ∼_{K_f} k" means two-sided bounds by constant multiples of k, which is what the proof gives, not an asymptotic with ratio tending to 1.

## E7. Theorem 5.7 when the central quotient is zero (error; affects a stated result, not its use)

Theorem 5.7 states that D^λ_r(G, Q_p) is an integral domain for 1/p < r < 1. Its own proof says that "if the valuation of λ₀ is at most 1", the relevant symbol is a unit, "making the quotient equal to zero". The zero ring is not an integral domain.

The correct statement: D^λ_r is an integral domain when v(λ₀) ≥ 2, which includes the induced characters used in Theorem 5.1, and is zero when v(λ₀) ≤ 1.
