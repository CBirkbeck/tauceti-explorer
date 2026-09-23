# Mistakes in Benoist, *The period-index problem for real surfaces*

Job ERRATA-PAPER-BENOIST-19. Worker: Claude Code, session `cc-442dc5`, 23 September 2026. The findings are in `PAPER-BENOIST-19.json` beside this file.

**Paper and version read.** Olivier Benoist, Publ. Math. IHÉS 130 (2019), 63–110, DOI 10.1007/s10240-019-00108-7. The version read is the published Numdam PDF (SHA-256 `8dfc0f22…`, all 48 pages), with arXiv v2 and the author copy used for targeted cross-checks.

**Earlier work.**
- The extraction PAPER-BENOIST-19 recorded E1–E19. It was completed with the reclassifications noted in the findings.
- Its E3 and E4 now affect a stated result, and E6, E11, E12, E16 and E18 affect nothing.
- They are kept here with everything they say.

**Existing corrections.** None was found, so all nineteen findings are new.
- Crossref registers no update for the DOI.
- Neither the Springer nor the Numdam page links an erratum.
- arXiv stops at v2 (May 2019).
- Benoist's homepage lists the paper without an erratum. (Its only erratum concerns a different paper.)

**Effect on the main results.** The period-index theorems for real surfaces use only the uniform case Ψ = Θ of Propositions 4.4–4.5, where the repairs hold. So the main results stand. Beyond that:
- **E1, E3 and E4 reach stated results.** §3.1's model is not a finite cover, and Propositions 4.4, 4.5 and 6.6 are not established in general.
- **Eight gaps affect only proofs,** each with a repair: E2, E5, E7, E8, E9, E10, E13 and one more step in E4's neighbourhood.
- **The rest are misprints.**

## Findings in brief

- **E1 (§3.1, p. 76).** The model rv² = sw² is called a "finite double cover". At r = s = 0 its fibre is P¹, so it is only generically of degree two and finite flat over S⁰. The finite Stein model has to be introduced separately.
- **E2 (Lemma 1.4, p. 70).** The lift β must be chosen compatibly, so that β mod n = p*α̃, before taking the trace. Another integral lift of the same Brauer class can differ by a Picard class.
- **E3 (Proposition 4.4, p. 84).** From the degree-one term b + a[e]₁ of the Bockstein map, b = 0 does not force a = 1. So [ζ]₁ = [α̃]₀[e]₁, not [e]₁, and the claimed equality holds only when [α̃]₀ is constant on Ψ.
- **E4 (Proposition 4.5, pp. 84–85).** The printed identity β|_{T_U} = p*α̃ + 2ε + cl(φ) mixes F₂- and Z(1)-coefficients. A typed replacement exists only when the evaluation is constant on Ψ.
- **E5 (Proposition 4.5, p. 85).** Assumption 4.1(ii) gives generation by pushforwards and curve classes, so a Picard class ν must be subtracted as well, and 2ν included in θ.
- **E6 (Lemma 7.3, (7.13)).** The sign should be p*η − ψ(ζ) with the (1, −φ) convention. The traced equations are unchanged.
- **E7 (proof of Lemma 7.3, p. 99).** The cancellation needs injectivity of the target p_*(Z/n) → j_*j*p_*(Z/n), not of the source.
- **E8 (Proposition 6.7, p. 95).** The half-period class is undefined for odd n, so the odd case must be separated. The conclusion first gives divisibility, and equality then follows from the index inequalities.
- **E9 (proof of Theorem 0.12, p. 95).** K₀ must contain a transcendence basis of K/R before K is written as a union of finite extensions of K₀.
- **E10 (proof of Theorem 0.13, p. 96).** The local parameters must be chosen jointly so that det(dy₁, dy₂) ≠ 0. Avoiding proportionality one at a time does not suffice.
- **E11 ((2.1), p. 72).** The Gysin twist is M(d′ − d), as in the cited [BW1, (1.22)].
- **E12 ((5.7), p. 88).** The boundary of the normal sequence lands in H¹(C, N_{C/T}).
- **E13 (proof of Proposition 0.7, p. 108).** The fixed point (0 : −1 : 1 : 1) can be a zero or pole of the specialized functions. General real points of u = 0, with the right sign, are needed.
- **E14 (proof of Proposition 0.7, p. 107).** Br(R(S)) should be Br(K(S)), for the real Puiseux field K.
- **E15 (proof of Theorem 0.6, p. 107).** The text should say "unique **nonzero** δ", since the zero class also has component 0 zero.
- **E16 (proof of Proposition 7.1, p. 103).** The argument uses torsion-freeness of the **cokernel** of the Picard cycle map, which is [BW1, Proposition 2.9], not of its kernel.
- **E17 (proof of Theorem 1.5, p. 71).** The symbol "n = dl" should be m = dn, the hypersurface degree.
- **E18 (§3.1, p. 77).** The fixed singular points over Sing R are where w vanishes, not v, since r = 0 and s a unit force w = 0.
- **E19 ((5.5), p. 87).** The restriction coefficient is √a₁·rg before g is rescaled by √a₁. This is harmless for the injectivity argument.
