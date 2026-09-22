# Mistakes in Bresciani, *On the birational section conjecture with strong birationality assumptions*

Job ERRATA-PAPER-BRESCIANI-24. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-BRESCIANI-24.json` beside this file.

**Paper and version read.** Giulio Bresciani, Inventiones mathematicae 235 (2024), 129–150, DOI 10.1007/s00222-023-01220-6.
- **Read:** arXiv 2108.13397v3 of 15 September 2023 (SHA-256 `e23989fb…b722`), the final author version, posted eleven days before online publication. Every passage below was re-read there.
- **Publisher PDF:** the extraction read the open-access publisher PDF, and its page numbers are given in parentheses. That PDF could not be re-fetched here.

**Earlier work.** The extraction PAPER-BRESCIANI-24 (partial) noted all three findings. Its other checks were confirmed not to be mistakes:
- the converse in Definition 4, which the paper itself says is false;
- the restricted product in footnote 1, which the paper states correctly;
- Corollary 10, which is stated without proof and is fine.

Its concerns about Lemma 8 and a Faltings input are open reading tasks, not mistakes.

**Existing corrections.** None was found:
- Crossref registers no erratum;
- v3 is the latest arXiv version;
- a web search found nothing;
- Pop's 2026 follow-up makes no remark.

**Effect.** The main theorems are not claimed to fail. E2 removes the justification for reducing to non-parabolic curves, which the proofs of Lemma 16 and of "t-b.l. ⇒ quasi-t-b.l." use, so that reduction needs a direct argument. E1 is a wrong citation number, and E3 a fixable step.

## E1. The base-change citation (misprint)

Twice in §2 the paper cites [Bre21b, Proposition A.18] for base change of the étale fundamental gerbe along an arbitrary field extension in characteristic 0. It needs this for k(t)/k and for residue fields of points. In the published [Bre21b]:
- Proposition A.18 covers only algebraic separable extensions;
- the statement for every extension is Proposition A.23.

## E2. Sections of parabolic affine curves (error)

**The claim.** On p.11 of v3 (p.141): "If X is parabolic affine, every Galois section of X is cuspidal … Because of this, we can always assume that X is non-parabolic."

**Why it is false.** A section is cuspidal only if it comes from a k-rational boundary point. Take X = P¹_Q minus the degree-2 point T² = 2. It is parabolic and affine, and its boundary has no rational point, so it has no cuspidal sections at all. Yet the rational point 0 gives it a geometric section.

**What needs repair.** The reductions to non-parabolic X therefore need a direct treatment of parabolic affine curves, including those whose boundary is a single point of degree 2:
- in the proof of Lemma 16;
- in the remark after Definition 18, where the identity map to a non-parabolic curve is not available.

## E3. Geometric images in the proof of Lemma 26 (gap)

The proof says each image ι_U(s) of the birational section s "by hypothesis … is cuspidal". Then, after finding the associated rational point x ∈ X̄(k), it uses ι_U(s) ∈ P_{U,x} for every open U.

The hypothesis only makes ι_U(s) geometric or cuspidal. When x ∈ U, ι_U(s) is the geometric section at x, not a member of the cuspidal packet. The argument is repaired by passing to the cofinal family of opens that omit x, along which the inverse limit is taken.
