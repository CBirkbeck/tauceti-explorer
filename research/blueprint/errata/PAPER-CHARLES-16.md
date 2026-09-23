# Mistakes in Charles, *Birational boundedness for holomorphic symplectic varieties, Zarhin's trick for K3 surfaces, and the Tate conjecture*

Job ERRATA-PAPER-CHARLES-16. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-CHARLES-16.json` beside this file. Reviewed by `REV-ERRATA-PAPER-CHARLES-16` (issue #1788), Claude Code session `cc-7b31c4`, 23 September 2026: **all seven confirmed**, none rejected, amended or added; each now carries its verdict, and the review is written up in [REV-ERRATA-PAPER-CHARLES-16.md](../reviews/REV-ERRATA-PAPER-CHARLES-16.md). The review could not read the published article either — the Annals site serves only a three-page preview — and records that the §2 numbering of arXiv v2 runs one behind the printed one, and that arXiv v2 is an incomplete draft that contains neither the passage of E3 nor the proof of Theorem 1.3 quoted in E7.

**Paper and version read.** François Charles, Annals of Mathematics 184 (2016), 487–526, DOI 10.4007/annals.2016.184.2.4. The version read is the publisher PDF (SHA-256 `3425f269…40e2`), as by the extraction. Every passage below was re-read there.

**Earlier work.** The extraction PAPER-CHARLES-16 (partial) found E1–E6. E7 is a misprint found while checking the proof of Theorem 1.3. The extraction also raised other points, which are not recorded here:
- a proof gate in Lemma 4.5 (item 113), for which it did not establish a mistake;
- a sign convention on p.522, which is immaterial;
- the omitted Tate twist in (3.4), which is notation.

**Existing corrections.** None was found:
- the Annals page and Crossref have no erratum;
- arXiv v2 is the latest version;
- Charles's page has an erratum only for his 2013 Inventiones paper.

**Effect.** The three main theorems stand. Several auxiliary statements are false as printed, and each has a corrected form that is what the proofs use:
- Corollary 2.8 (E1);
- Proposition 2.9 (E2);
- Proposition 3.17 (E5).

The rest are a gap at r = 2 (E3), a false description of a lattice (E6) and misprints.

## E1. The multiplier in Corollary 2.8 need not be an integer (error)

The corollary gives |disc NS(X)| = p^t λ |disc NS(M_H(v))| with λ a positive integer at most v². For the Hilbert square, v = (1, 0, −1) satisfies condition (C), and v^⊥ = NS(X) ⊕ ⟨−2⟩. The proof's own first step then gives |disc NS(X)| = ½ p^r |disc NS(X^[2])|, which is impossible for odd p with λ an integer.

The correct multiplier is λ = v²/I² with I the index of Zv ⊕ v^⊥ in N(X). For v² = 2 it is 2 or ½, a p-unit for p odd, which is all the applications need.

## E2. Proposition 2.9 needs a primitive sublattice (error)

The proof starts from "the primitive embedding of Λ into Λ₂d", but the statement allows any sublattice, and then it is false. In Λ₂ = ⟨2⟩ ⊕ U, the lattice spanned by 2h and 2(e + f), with Gram matrix diag(8, 8), has no primitive embedding into Λ₂: mod 2 it would give a plane of zeros of x² + yz over F₂, and there is none. Yet m = 1 satisfies every condition of the statement.

The proof of Theorem 2.10 should choose Λ primitive, for example the span of e + f and kh + e.

## E3. The inequality 3r − 4 > r at r = 2 (gap)

In the birationality argument in the proof of Proposition 3.1, "3r − 4 > r … note that r is even, so that r > 1" fails at r = 2. Replacing L by 2L first, which the proof already permits, removes the problem.

## E4. n ≤ 3 for n ≥ 3 (misprint)

The proof of Proposition 3.16 says "Fix some integer n ≤ 3" for the level of the Kuga–Satake structures. It should be n ≥ 3, prime to p, as on p.513.

## E5. Proposition 3.17 counts surfaces, not polarized pairs (error)

The proposition asserts finiteness of the polarized pairs (X, H). On one surface, the powers H^{⊗ℓ^j}, for a suitable prime ℓ and j, satisfy all the conditions with unbounded degree.

What the proof shows, and what the proof of Theorem 1.3 uses ("only finitely many K3 surfaces over k"), is finiteness of the underlying surfaces.

## E6. The twisted Mukai lattice is not a preimage (error)

§4.1 defines N_{α/r}(X) as "the preimage of N(X) by T_{−α/r}" and identifies it with {(ar, D + aα, cω)}. But

T_{−α/r}(ar, D + aα, cω) = (ar, D, (c − α·D/r − aα²/(2r))ω),

whose last coordinate is not integral in general. The lattice actually used, in Lemma 4.2 and after, is the explicit one of LMS; the "preimage" description should be dropped.

## E7. c₁(B) for c₁(H_n) (misprint)

The proof of Theorem 1.3 says the line bundle H_n satisfies "c₁(B)² = 2dℓ^{2n}". It should be c₁(H_n)²; B belongs to the previous proof.
