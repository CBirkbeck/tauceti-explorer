# Errata: Tsimerman, The André–Oort conjecture for A_g

Independent review by Codex (`codex-7e92bd`), 23 September 2026, for `REV-ERRATA-PAPER-TSIMERMAN-18`. Original errata author: Claude Code, `cc-fb70e5`.

Five findings are confirmed. E1–E3 preserve the original IDs; E4 adds the literal field-of-moduli equality in the proof sketch, and E5 records definition slips in the preprint that publication has already corrected. None changes the André–Oort theorem. E2 is a quantifier misprint whose stronger proof is already present, and E4 is repaired by the final article’s detailed field-of-definition argument.

I compared the affected passages of the [published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), pp.380–386, with [arXiv 1506.01466v5](https://arxiv.org/pdf/1506.01466v5), pp.2–7. The latter is dated **1 December 2015**. The reflex-ideal notation issue in E1 is present in both versions; the former errata’s claim that it first appears in publication was incorrect. Page images were used to verify symbols and to rule out extraction artifacts.

## E1 — misprint; affects nothing

**Locator:** Published §5, proof of Theorem 5.2, p.386; related reflex-ideal/cardinality notation already occurs in arXiv 1506.01466v5, §5, pp.6–7. Both directly read, including page images.

**Printed:** Norm_{K/Q}(I), |O_K/I|, and r_{K,φ}(I)·overline(r_{K,φ}(I)) (published); |O_K/I| and ideal equalities written with r′_{K,φ} (v5).

**Correction:** Take the ideal norm from the reflex field: N_{K*/Q}(I). For an integral representative I, its cardinality expression is |O_{K*}/I|. For a fractional ideal use the positive rational ideal norm, not a quotient cardinality. Write the ideal-level identity as t_{K,φ}(I)·overline(t_{K,φ}(I)) = N_{K*/Q}(I) O_K, reserving r for the induced class-group map.

**Check:** The input I belongs to the ideal group of K*, whereas t(I) is an ideal of K. Multiplying the reflex-type product by its complex conjugate includes every embedding of K* exactly once, giving N_{K*/Q}(I) after extension to the normal closure, hence the asserted ideal identity over K. If t(I)=(a), the ratio a·bar(a)/N(I) is a totally positive unit in the real subfield, and changing a by a unit changes it by a unit norm. Thus the intended unit-quotient argument is preserved. The old entry’s claim that the issue occurs only in publication is wrong: the reflex-field ideal I and |O_K/I| already occur together on v5 pp.6–7. The published version makes the incorrect norm subscript explicit. Integral class representatives may always be chosen; retaining a fractional I requires the norm notation instead of cardinality.

**Review:** confirmed. Confirmed the field and ideal/class-group typing errors in both versions. Corrected the version comparison and added the integral-versus-fractional qualification needed to make the proposed quotient expression defined. Checked the reflex norm identity and the unit-ratio calculation, without certifying every separate degree equality in the CM reciprocity discussion.

**Known correction:** new.

## E2 — misprint; affects nothing

**Locator:** Published Proposition 2.2 and its preceding proof, p.382; Theorem 4.2 proof, p.385. The same weak proposition is in arXiv v5 p.4, with its counting argument on p.3; the earlier consumer is Theorem 4.1, pp.5–6.

**Printed:** ∃ A,B ∈ S(E,Φ) with minimum isogeny degree ≥ |Disc(E)|^{1/4−o_g(1)} (Proposition 2.2).

**Correction:** State the conclusion with the quantifiers proved and used: for every A∈S(E,Φ), there is B∈S(E,Φ) such that every isogeny A→B has degree at least |Disc(E)|^{1/4−o_g(1)}.

**Check:** The paragraph immediately preceding Proposition 2.2 fixes an arbitrary A, so its counting argument already proves the stronger assertion. Uniformity in E at fixed degree can be made explicit: the number a_E(n) of integral ideals of norm n is at most the 2g-fold divisor function d_{2g}(n), by comparing local Euler factors. For every ε>0, d_{2g}(n)≪_{g,ε}n^ε, so at most O_{g,ε}(X^{1+ε}) targets can be reached by isogenies of degree at most X from that fixed A. Comparing this with |S(E,Φ)|≥|Disc(E)|^{1/4−o_g(1)} gives a distant B for every A. Theorem 4.2 should retain its given A rather than appear to select a new first member of a merely existential pair. This is an understated quantifier in the proposition, not an absent mathematical argument: the stronger proof is already printed.

**Review:** confirmed. Confirmed the statement/use mismatch and independently checked the uniform ideal-counting repair. Reclassified gap as misprint: the preceding paragraph already supplies the stronger proof, so this is a quantifier correction with no new proof input and no changed theorem.

**Known correction:** new.

## E3 — error; affects nothing

**Locator:** Published §2.2, p.382; arXiv 1506.01466v5 §2.2, p.3. Both directly read.

**Printed:** “the regulators of E and E₀ are the same”.

**Correction:** With the usual class-number-formula normalization, R_E = 2^{g−1} R_{E₀}/Q_E, where Q_E=[O_E^×:μ_E O_{E₀}^×]∈{1,2}. Thus the regulators are comparable by constants depending only on g, rather than equal. The ratio can vary with E through Q_E.

**Check:** The unit rank is g−1 in both fields. On units from E₀ the logarithmic embedding for E doubles every coordinate, because a complex place has weight two. Its regulator determinant is therefore 2^{g−1}R_{E₀}; the full E-unit lattice contains this lattice with index Q_E, giving the formula. For completeness, u/bar(u) is a root of unity by Kronecker’s theorem. The map u↦u/bar(u) induces an injection O_E^×/(μ_E O_{E₀}^×)→μ_E/μ_E²: if u/bar(u)=ζ², then u/ζ is real. Hence Q_E is 1 or 2. For g=3 the ratio is 4/Q_E, always 2 or 4, so equality already fails for any sextic CM field, for example Q(ζ₇). Only fixed-degree comparability enters the relative Brauer–Siegel estimate, which is unchanged. This derivation verifies the correction without claiming to have directly consulted the Washington proposition cited by the original errata.

**Review:** confirmed. Confirmed under the standard regulator normalization, independently deriving the factor from logarithmic lattices and the Hasse unit index. Replaced the imprecise claim that the factor depends only on g with uniform comparability in g. The sextic case provides a definite failure of equality; the discriminant exponent remains unchanged.

**Known correction:** new.

## E4 — error; affects nothing

**Locator:** Published §1.1 proof sketch, p.380; arXiv v5 §1.1, p.2, and the opening of the proof of Theorem 4.1, p.5. The published detailed replacement is Lemma 4.1 and Theorem 4.2, pp.384–385.

**Printed:** “the field of moduli K of all these abelian varieties is the same” (published sketch).

**Correction:** Do not identify the fields as subfields of the fixed algebraic closure. For the required comparison, fix A and use the bounded field of definition Q(A)′ of published Lemma 4.1. Every ideal quotient B=A/T_I is defined over that field, and the compositum used in Theorem 4.2 has degree bounded over Q(A) by a constant depending only on g. The final detailed proof already gives this argument.

**Check:** For E=Q(√−23), the three elliptic CM j-invariants are the roots of H_{−23}(X)=X³+3491750X²−5151296875X+12771880859375, recorded in the official Sage reference at https://doc.sagemath.org/html/en/reference/arithmetic_curves/sage/schemes/elliptic_curves/cm.html#sage.schemes.elliptic_curves.cm.hilbert_class_polynomial. The polynomial is irreducible modulo 2 (X³+X+1), and its discriminant is −5^18·7^12·11^4·17²·19²·23. It has one real root and two nonreal roots. The field of moduli of a complex elliptic curve with its canonical principal polarization is Q(j). For the real root this is a subfield of R, while for a nonreal root it is not; these are distinct subfields of C, although they have the same degree and are abstractly isomorphic. All these elliptic curves can be equipped with the fixed primitive CM type. The printed literal field equality therefore fails. The published detailed proof uses bounded field extensions instead and is not invalidated by this sketch error.

**Review:** confirmed. New finding from the introductory passage and its v5 consumer. Checked the printed sentence in the published page image, the primary computational reference for H_{−23}, and its irreducibility/discriminant by exact arithmetic. Distinguished equality of embedded fields from equality of degrees and noted the already-correct published detailed argument.

**Known correction:** new.

## E5 — misprint; affects nothing

**Locator:** arXiv 1506.01466v5: §2.1 and §2.2, p.3; opening of Theorem 5.1 proof, p.6. These slips are already corrected in the published article, pp.381–382 and 385.

**Printed:** “any global section” ω (v5 §2.1); g=[E:Q] (v5 §2.2); “degree g” for K and “normal closure of Q” (v5 §5).

**Correction:** Require ω≠0. Set g=[E₀:Q]=[E:Q]/2, take the CM field K to have degree 2g, and take L to be the normal closure of K over Q. These are the formulations in the final article.

**Check:** The zero Hodge section makes the index term infinite and the logarithm of the integral undefined. A CM type for E contains half its embeddings, so its tangent representation has dimension [E:Q]/2, not [E:Q]. The reciprocal CM field K in the g-dimensional argument likewise has degree 2g. Finally, the subsequent Galois/reflex construction requires a normal closure containing K; the normal closure of Q supplies no such extension for nontrivial K. Direct comparison with the final article verifies all four corrections. These are earlier-version slips, not new errors in the published text.

**Review:** confirmed. New version-comparison finding, confirmed only for v5 and explicitly marked already corrected in the final publication. The typed definitions and nonzero-section requirement were checked directly.

**Known correction:** Corrected in the published article, Annals of Mathematics 187 (2018), pp.381 (§2.1: nonzero section), 382 (§2.2: g=[E₀:Q]) and 385 (Theorem 5.2 proof: degree 2g and normal closure of K over Q), https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf..

## Correction searches and verification limits

The arXiv history, Annals article page, DOI/Crossref record, author’s [publication page](https://www.math.toronto.edu/jacobt/) and title/erratum/corrigendum searches were checked on 23 September 2026. No separate correction of E1–E4 was located. This is a bounded search, not a claim that none exists. The arXiv warning about the withdrawn general-Shimura claim in v2 is a separate matter; it does not identify these findings as corrected. E5 is explicitly corrected in the final PDF.

The original three findings were re-derived: reflex norm and unit identities for E1, uniform divisor-function counting for E2, and logarithmic unit lattices for E3. For E4, exact symbolic arithmetic confirmed the Hilbert polynomial’s reduction modulo 2 and negative discriminant. The example concerns embedded fields, not a difference in their degrees. No assertion about the correctness of the other CM-reciprocity degree equalities or of an entire prerequisite paper is being made.

SHA-256: published PDF `43259ca3cfedfb574bf1fe2f80e1023cb736ea299a76588536fd816340722abc`; arXiv v5 `ccc5f8beb50e11fc46bdaf1f05ae5718d26280643698585dcca3ddb99dc3ee9c`. Downloads, rendered pages and exact diagnostics remain in scratch. Per-finding searches and independent verdicts are in the JSON.
